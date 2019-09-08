#include "MUXbutton.hpp"
MUXbutton::MUXbutton(uint16_t t_slot, uint8_t t_key, uint8_t t_pullDirection,
                     multi4067 &t_mux)
    : slot(t_slot),
      key(t_key),
      pullDirection(t_pullDirection),
      state(0),
      downLastTime(0),
      upLastTime(0),
      stateSwitch(0),
      mux(t_mux) {}
void MUXbutton::updateState() {
    state = mux.dRead(slot * 2 - 1);
    if (state == (LOW ^ pullDirection)) {
        if (!downLastTime && !stateSwitch) {
            downLastTime = millis();
        } else if (millis() - downLastTime >= 10 && downLastTime) {
            stateSwitch = 1;
            Keyboard.press(key);
        }
        if (millis() - downLastTime >= 10) {
            mux.dWrite(slot * 2 - 2, 1);
        }
    }
    if (state == (HIGH ^ pullDirection)) {
        if (!upLastTime && stateSwitch) {
            upLastTime = millis();
        } else if (millis() - upLastTime >= 10 && upLastTime) {
            if (stateSwitch) {
                Keyboard.release(key);
            }
            stateSwitch = 0;
            downLastTime = 0;
            upLastTime = 0;
        }
    }
}