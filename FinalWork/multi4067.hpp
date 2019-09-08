#ifndef MULTI4067_HPP
#define MULTI4067_HPP
#include <stdint.h>
/*
hc4067's enable pins conncted to arduino or hc595
*/
class multi4067 {
   private:
    uint8_t deviceNum;
    /*
    max number of devices is 8
    */
    uint8_t latchPin;
    uint8_t clockPin;
    uint8_t dataPin;
    uint8_t sigPin;
    uint16_t currentPin;
    uint8_t currentChip;
    void selectPin(uint16_t pinNum);

   public:
    multi4067(uint8_t t_deviceNum, uint8_t t_latchPin, uint8_t t_clockPin,
              uint8_t t_dataPin, uint8_t t_sigPin);
    uint16_t getCurrentPin();
    uint8_t dRead(uint8_t pin);
    uint16_t aRead(uint8_t pin);
    void dWrite(uint8_t pin, uint8_t state);
    void aWrite(uint8_t pin, uint16_t val);
};
#endif