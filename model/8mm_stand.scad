dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;

lp_length = 30;
lp_height = 45;
lp_lip_length = 40;

slot_num = 8;
block_height = 20;
module pedestal_stand1() {//6*7
        difference(){
            square(size = [lp_length,lp_length],center = true);
            translate([0, dh, 0]) {
                circle(r = wirehole_radius,$fn = 50);
            }
        }
        translate([lp_length/2+dh, 0, 0]) {
            square(size=[dh*2, 15], center=true);
        }
        translate([-(lp_length/2+dh), 0, 0]) {
            square(size=[dh*2, 15], center=true);
        }
        translate([0, -lp_length/2, 0]) {
            square(size=[lp_length/2,dh*4], center=true);
        }
}

module pedestal_stand2() {//6*2
    difference(){
        union(){
            pedestal_stand1();
                translate([0,-(lp_length+block_height+dh*2)/2, 0]) {
                    difference(){
                        square(size=[lp_length+dh*2*2,block_height+dh*2], center=true);
                        translate([0, -(block_height-dh*2)/2, 0]) {
                            square(size=[lp_length, dh*4], center=true);
                        }
                    }
                }
        }
            translate([0, -(lp_length/2+dh), 0]) {
                square(size=[lp_length/2,dh*2], center=true);
            }
    }
}
for (i=[0:1:3]) {
    translate([i*(lp_length+dh*5),0, 0]) {
        pedestal_stand2();
    }
    translate([i*(lp_length+dh*5), 1.7*(lp_length+dh*3), 0]) {
        pedestal_stand2();
    }
    translate([i*(lp_length+dh*5), 3.4*(lp_length+dh*3), 0]) {
        pedestal_stand2();
    }
    translate([i*(lp_length+dh*5), 5.1*(lp_length+dh*3), 0]) {
        pedestal_stand2();
    }
}