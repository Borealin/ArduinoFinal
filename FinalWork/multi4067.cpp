#include "multi4067.hpp"
#include <Arduino.h>
multi4067::multi4067(uint8_t t_deviceNum, uint8_t t_latchPin,
                     uint8_t t_clockPin, uint8_t t_dataPin, uint8_t t_sigPin)
    : deviceNum(t_deviceNum),
      latchPin(t_latchPin),
      clockPin(t_clockPin),
      dataPin(t_dataPin),
      sigPin(t_sigPin),
      currentPin(1024),
      currentChip(16) {
    pinMode(latchPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
    pinMode(dataPin, OUTPUT);
}
void multi4067::selectPin(uint16_t t_pinNum) {
    uint8_t data = (1 << (t_pinNum >> 4));
    digitalWrite(latchPin, 0);
    shiftOut(dataPin, clockPin, MSBFIRST, ((1 << deviceNum) - 1) ^ data);
    shiftOut(dataPin, clockPin, MSBFIRST, t_pinNum % 16);
    digitalWrite(latchPin, 1);
}
uint16_t multi4067::getCurrentPin() { return currentPin; }

uint8_t multi4067::dRead(uint8_t pin) {
    selectPin(pin);
    pinMode(sigPin, INPUT);
    return digitalRead(sigPin);
}
uint16_t multi4067::aRead(uint8_t pin) {
    selectPin(pin);
    pinMode(sigPin, INPUT);
    return analogRead(sigPin);
}
void multi4067::dWrite(uint8_t pin, uint8_t state) {
    selectPin(pin);
    pinMode(sigPin, OUTPUT);
    digitalWrite(sigPin, state);
    delayMicroseconds(500);
}
void multi4067::aWrite(uint8_t pin, uint16_t val) {
    selectPin(pin);
    pinMode(sigPin, OUTPUT);
    analogWrite(sigPin, val);
}
