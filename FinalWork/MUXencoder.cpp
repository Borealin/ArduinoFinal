#include "MUXencoder.hpp"
MUXencoder::MUXencoder(uint16_t t_slot, uint8_t t_axis, uint8_t t_dpi,
                       multi4067& t_mux)
    : slot(t_slot),
      axis(t_axis),
      dpi(t_dpi),
      pos(0),
      pin1LastState(2),
      pin2LastState(2),
      mux(t_mux) {}
void MUXencoder::timerEvent() {
    uint8_t p1state = mux.dRead(slot * 2 - 2),
            p2state = mux.dRead(slot * 2 - 1);
    if (p1state != pin1LastState || p2state != pin2LastState) {
        pin1LastState = p1state;
        pin2LastState = p2state;
        if (p1state == p2state) {
            pos++;
        } else {
            pos--;
        }
    }
}

void MUXencoder::updateState() {
    timeEvent();
    Mouse.move(((!axis) ? pos : 0) * dpi, ((axis) ? pos : 0) * dpi, 0);
}