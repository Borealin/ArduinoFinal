dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;
lp_length = 30;
lp_height = 45;
lp_lip_length = 40;
length35 = 48;
inner_length35 = 27.5;
height35 = 95;
module up_base_35mm(){//2*1
        difference(){
            square(size=[length35, length35], center=true);
            square(size=[lp_length, lp_length], center=true);
            translate([lp_lip_length/2-(lp_lip_length-lp_length)/4, 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
            translate([-(lp_lip_length/2-(lp_lip_length-lp_length)/4), 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
        }
}
module up_stand1_35mm(){//2*2
            square(size = [length35,height35],center = true);
}
module up_stand2_35mm(){//2*2
        square(size = [height35,length35-2*2],center = true);
}
module up_lip_35mm(){//2*1
        difference(){
            square(size = [length35,length35],center = true);
            square(size=[inner_length35, inner_length35], center=true);
        }
}
for (i=[0:1:1]) {
    translate([0, i*(length35+dh), 0]) {
        up_base_35mm();
    }
}
for (i=[0:1:1]) {
    translate([length35+dh, i*(height35+dh), 0]) {
        up_stand1_35mm();
    }
}
for (i=[0:1:1]) {
    translate([2*(length35+dh), i*(height35+dh), 0]) {
        up_stand1_35mm();
    }
}
for (i=[0:1:1]) {
    translate([3*(length35+dh), i*(height35+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_35mm();
        }
    }
}
for (i=[0:1:1]) {
    translate([4*(length35+dh), i*(height35+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_35mm();
        }
    }
}
for (i=[0:1:1]) {
    translate([5*(length35+dh), i*(length35+dh), 0]) {
        up_lip_35mm();
    }
}
