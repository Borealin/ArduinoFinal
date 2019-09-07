#include "megaMUX.hpp"
#include <Arduino.h>
megaMUX::megaMUX(uint8_t t_deviceNum, uint8_t t_latchPin, uint8_t t_clockPin,
                 uint8_t t_dataPin, uint8_t t_sigPin)
    : deviceNum(t_deviceNum),
      latchPin(t_latchPin),
      clockPin(t_clockPin),
      dataPin(t_dataPin),
      sigPin(t_sigPin),
      currentPin(512),
      currentChip(16) {
    pinMode(latchPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
    pinMode(dataPin, OUTPUT);
}
uint8_t megaMUX::dRead(uint8_t pin) {
    selectPin(pin);
    pinMode(sigPin, INPUT);
    return digitalRead(sigPin);
}
uint16_t megaMUX::aRead(uint8_t pin) {
    selectPin(pin);
    pinMode(sigPin, INPUT);
    return analogRead(sigPin);
}
void megaMUX::dWrite(uint8_t pin, uint8_t state) {
    selectPin(pin);
    pinMode(sigPin, OUTPUT);
    digitalWrite(sigPin, state);
}
void megaMUX::aWrite(uint8_t pin, uint16_t val) {
    selectPin(pin);
    pinMode(sigPin, OUTPUT);
    analogWrite(sigPin, val);
}

void megaMUX::selectPin(uint16_t t_pinNum) {
    uint8_t data = (1 << (t_pinNum >> 5));
    digitalWrite(latchPin, 0);
    shiftOut(dataPin, clockPin, MSBFIRST, ((1 << deviceNum) - 1) ^ data);
    shiftOut(dataPin, clockPin, MSBFIRST, t_pinNum % 32);
    digitalWrite(latchPin, 1);
    digitalWrite(latchPin, 0);
    shiftOut(dataPin, clockPin, MSBFIRST,
             ((1 << deviceNum) - 1) ^ data + (1 << 7));
    shiftOut(dataPin, clockPin, MSBFIRST, t_pinNum % 32);
    digitalWrite(latchPin, 1);
}
