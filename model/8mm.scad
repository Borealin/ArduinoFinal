dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;

lp_length = 30;
lp_height = 45;
lp_lip_length = 40;

slot_num = 8;
block_height = 20;
module pedestal_base_base() {//1*1
    linear_extrude(height = dh*4,center = true,convexity = 10){
        square(size=[(dh*4+lp_length)*6+2*dh*4+dh,9*dh*4+8*lp_length], center=true);
    }
}
module pedestal_base_stand1() {//1*1
    linear_extrude(height = dh*4,center = true,convexity = 10){
        square(size=[lp_length+dh*2+block_height,9*dh*4+8*lp_length], center=true);
    }
}
module pedestal_base_stand2() {//1*1
    linear_extrude(height = dh*4,center = true,convexity = 10){
        difference(){
            square(size=[lp_length+dh*2+block_height,9*dh*4+8*lp_length], center=true);
            translate([(lp_length+dh*2)/2,0,0]) {
                rotate([0, 0, 90]) {
                    square(size = [(lp_length+dh*4)*slot_num-dh*4-lp_length,dh*2],center = true);
                }
            }
        }
    }
}
module pedestal_stand1() {//6*7
    linear_extrude(height = dh*4,center = true,convexity = 10){
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
}

module pedestal_stand2() {//6*2
    difference(){
        union(){
            pedestal_stand1();
            linear_extrude(height = dh*4,center = true,convexity = 10){
                translate([0,-(lp_length+block_height+dh*2)/2, 0]) {
                    difference(){
                        square(size=[lp_length+dh*2*2,block_height+dh*2], center=true);
                        translate([0, -(block_height+dh*2)/2, 0]) {
                            square(size=[lp_length, dh*4], center=true);
                        }
                    }
                }
            }
        }
        linear_extrude(height = dh*4.01,center = true,convexity = 10){
            translate([0, -(lp_length/2+dh), 0]) {
                square(size=[lp_length/2,dh*2], center=true);
            }
        }
    }
}
pedestal_base_base();
translate([lp_length*5.3, 0, 0]) {
    pedestal_base_stand1();
}
translate([lp_length*7.3,0, 0]) {
    pedestal_base_stand2();
}