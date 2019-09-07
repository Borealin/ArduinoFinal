dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;

lp_length = 30;
lp_height = 45;
lp_lip_length = 40;

slot_num = 8;
block_height = 20;
module pedestal_base_base() {//1*1
        square(size=[(dh*4+lp_length)*6+2*dh*4+dh,9*dh*4+8*lp_length], center=true);
}
module pedestal_base_stand1() {//1*1
        square(size=[lp_length+dh*2+block_height,9*dh*4+8*lp_length], center=true);
}
module pedestal_base_stand2() {//1*1
        difference(){
            square(size=[lp_length+dh*2+block_height,9*dh*4+8*lp_length], center=true);
            translate([(lp_length+dh*2)/2,0,0]) {
                rotate([0, 0, 90]) {
                    square(size = [(lp_length+dh*4)*slot_num-dh*4-lp_length,dh*2],center = true);
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