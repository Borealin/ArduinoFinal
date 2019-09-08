#ifndef MUXENCODER_HPP
#define MUXENCODER_HPP
#include <Mouse.h>
#include "multi4067.hpp"
class MUXencoder {
   private:
    uint16_t slot;
    uint8_t axis;  // 0 is x,1 is y
    uint8_t dpi;
    uint32_t timeGap;
    uint32_t pos;
    uint8_t pin1LastState;
    uint8_t pin2LastState;
    multi4067& mux;
    void timerEvent();

   public:
    MUXencoder(uint16_t t_slot, uint8_t t_axis, uint8_t t_dpi,
               multi4067& t_mux);
    void updateState();
};
#endif
