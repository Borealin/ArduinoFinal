#include <Arduino.h>
#line 1 "d:\\DailyWork\\Arduino\\FinalWork\\FinalWork\\FinalWork.ino"
#line 1 "d:\\DailyWork\\Arduino\\FinalWork\\FinalWork\\FinalWork.ino"
#include "MUXbutton.hpp"
multi4067 mux(6, 6, 5, 7, A1);
MUXbutton bt1(18, 'a', 0, mux);
MUXbutton bt2(20, 'b', 0, mux);
MUXbutton bt3(22, 'c', 0, mux);
MUXbutton bt4(24, 'd', 0, mux);
MUXbutton bt5(2, 'e', 0, mux);
MUXbutton bt6(6, 'f', 0, mux);
MUXbutton bt7(45, 'g', 0, mux);
#line 10 "d:\\DailyWork\\Arduino\\FinalWork\\FinalWork\\FinalWork.ino"
void setup();
#line 11 "d:\\DailyWork\\Arduino\\FinalWork\\FinalWork\\FinalWork.ino"
void loop();
#line 10 "d:\\DailyWork\\Arduino\\FinalWork\\FinalWork\\FinalWork.ino"
void setup() { Keyboard.begin(); }
void loop() {
    bt1.updateState();
    bt2.updateState();
    bt3.updateState();
    bt4.updateState();
    bt5.updateState();
    bt6.updateState();
    bt7.updateState();
}

