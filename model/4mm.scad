dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;

lp_length = 30;
lp_height = 45;
lp_lip_length = 40;

slot_num = 8;
block_height = 20;
module pedestal_stand3() {//6*2
        difference(){
            union(){
                square(size = [(lp_length+dh*4)*slot_num,lp_length],center = true);
                translate([-4*(lp_length+dh*4)-dh*2,0, 0]) {
                    square(size=[dh*4, lp_length], center=true);
                }
                difference(){
                    translate([-dh*2, -(lp_length+block_height+dh*2)/2, 0]) {
                        square(size = [(lp_length+dh*4)*slot_num-dh*4,block_height+dh*2],center = true);
                    }
                    translate([-dh*2, -(lp_length+block_height+dh*2+dh*2)/2, 0]) {
                        square(size = [(lp_length+dh*4)*slot_num-dh*4-lp_length,dh*2],center = true);
                    }
                }
            }
            for (i=[-4:1:3]) { 
                translate([i*(lp_length+dh*4)+lp_length/2,0, 0]) {
                    circle(r = wirehole_radius,$fn = 500);
                }
                translate([(i+1)*(lp_length+dh*4)-dh*2,0, 0]) {
                    square(size=[dh*4, 15], center=true);
                }
                translate([i*(lp_length+dh*4)+lp_length/2,-(lp_length+dh*2)/2, 0]) {
                    square(size=[wirehole_radius*2,dh*2], center=true);
                }
            }
            translate([-4*(lp_length+dh*4)-dh*2,0, 0]) {
                square(size=[dh*4, 15], center=true);
            }
        }
}
module pedestal_panel1(){//6*1
        difference(){
            square(size=[lp_length, 7*dh*4+8*lp_length], center=true);
            for (i=[-3:1:3]) {
                translate([0, i*(lp_length+dh*4), 0]) {
                    square(size=[lp_length/2,dh*4], center=true);
                }
            }
            for (i=[-3.5:1:3.5]) {
                translate([0, i*(lp_length+dh*4), 0]) {
                    square(size=[4.49,9.78], center=true);
                }
            }
        }
        translate([0, 4*(lp_length+dh*4), 0]) {
            square(size=[lp_length/2,dh*4], center=true);
        }
        translate([0, -4*(lp_length+dh*4), 0]) {
            square(size=[lp_length/2,dh*4], center=true);
        }
        for (i=[-3.5:1:3.5]) {
            translate([(lp_length+dh*2)/2, i*(lp_length+dh*4), 0]) {
                square(size=[dh*2,wirehole_radius*2], center=true);
            }
            translate([-(lp_length+dh*2)/2, i*(lp_length+dh*4), 0]) {
                square(size=[dh*2,wirehole_radius*2], center=true);
            }
        }
}
module pedestal_panel2(){//6*1
        square(size=[lp_length, 9*dh*4+8*lp_length], center=true);
}
for (i=[0:1:3]) {
    translate([0, i*(lp_length*1.9), 0]) {
        pedestal_stand3();
    }
}
for (i=[0:1:7]) {
    translate([0, (i+5.5)*(lp_length*1.3), 0]) {
        rotate([0, 0, 90]) {
            pedestal_panel1();
        }
    }
}
for (i=[0:1:7]) {
    translate([8.5*(lp_length+4*dh), i*(lp_length*1.2)-lp_length, 0]) {
        rotate([0, 0, 90]) {
            pedestal_panel2();
        }
    }
}
for (i=[0:1:15]) {
    translate([8.5*(lp_length+4*dh), (i/3.5+5)*(lp_length*1.9)-lp_length, 0]) {
        rotate([0, 0, 90]) {
            square(size=[lp_length/3, 9*dh*4+8*lp_length], center=true);
        }
    }
}

