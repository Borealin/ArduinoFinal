dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;
lp_length = 30;
lp_height = 45;
lp_lip_length = 40;
length_re = 48;
inner_radius_re = 8.5/2;
height_re = 95;
module up_base_re(){//3*1
        difference(){
            square(size=[length_re, length_re], center=true);
            square(size=[lp_length, lp_length], center=true);
            translate([lp_lip_length/2-(lp_lip_length-lp_length)/4, 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
            translate([-(lp_lip_length/2-(lp_lip_length-lp_length)/4), 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
        }
}
module up_stand1_re(){//3*2
            square(size = [length_re,height_re],center = true);
}
module up_stand2_re(){//3*2
        square(size = [height_re,length_re-2*2],center = true);
}
module up_lip_re(){//3*1
        difference(){
            square(size = [length_re,length_re],center = true);
            circle(r=inner_radius_re);
        }
}
for (i=[0:1:2]) {
    translate([0, i*(length_re+dh), 0]) {
        rotate([0,0,90]){
            up_base_re();
        }
    }
}
for (i=[0:1:2]) {
    translate([length_re+dh, i*(height_re+dh), 0]) {
        up_stand1_re();
    }
}
for (i=[0:1:2]) {
    translate([2*(length_re+dh), i*(height_re+dh), 0]) {
        up_stand1_re();
    }
}
for (i=[0:1:2]) {
    translate([3*(length_re+dh), i*(height_re+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_re();
        }
    }
}
for (i=[0:1:2]) {
    translate([4*(length_re+dh), i*(height_re+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_re();
        }
    }
}
for (i=[0:1:2]) {
    translate([5*(length_re+dh), i*(length_re+dh), 0]) {
        rotate([0, 0, 90]) {
            up_lip_re();
        }
    }
}
