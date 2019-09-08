#ifndef MUXBUTTON_HPP
#define MUXBUTTON_HPP
#include <Keyboard.h>
#include "multi4067.hpp"
class MUXbutton {
   private:
    uint16_t slot;
    uint8_t key;
    uint8_t pullDirection;
    uint8_t state;
    unsigned long downLastTime;
    unsigned long upLastTime;
    uint8_t stateSwitch;
    multi4067& mux;

   public:
    MUXbutton(uint16_t t_slot, uint8_t t_key, uint8_t t_pullDirection,
              multi4067& t_mux);
    void updateState();
};
#endif
