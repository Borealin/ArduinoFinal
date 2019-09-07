#include <stdint.h>
class megaMUX {
   private:
    uint8_t deviceNum;
    uint8_t latchPin;
    uint8_t clockPin;
    uint8_t dataPin;
    uint8_t sigPin;
    uint16_t currentPin;
    uint8_t currentChip;
    void selectPin(uint16_t t_pinNum);

   public:
    megaMUX(uint8_t t_deviceNum, uint8_t t_latchPin, uint8_t t_clockPin,
            uint8_t t_dataPin, uint8_t t_sigPin);
    uint8_t dRead(uint8_t pin);
    uint16_t aRead(uint8_t pin);
    void dWrite(uint8_t pin, uint8_t state);
    void aWrite(uint8_t pin, uint16_t val);
};
