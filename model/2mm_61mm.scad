dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;
lp_length = 30;
lp_height = 45;
lp_lip_length = 40;
length61 = 72;
inner_length61 = 56.5;
height61 = 95;
module up_base_61mm(){//4*1
        difference(){
            square(size=[length61, length61], center=true);
            square(size=[lp_length, lp_length], center=true);
            translate([lp_lip_length/2-(lp_lip_length-lp_length)/4, 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
            translate([-(lp_lip_length/2-(lp_lip_length-lp_length)/4), 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
        }
}
module up_stand1_61mm(){//4*2
            square(size = [length61,height61],center = true);
}
module up_stand2_61mm(){//4*2
        square(size = [height61,length61-2*2],center = true);
}
module up_lip_61mm(){//4*1
        difference(){
            square(size = [length61,length61],center = true);
            square(size=[inner_length61, inner_length61], center=true);
        }
}
for (i=[0:1:3]) {
    translate([0, i*(length61+dh), 0]) {
        up_base_61mm();
    }
}
for (i=[0:1:3]) {
    translate([length61+dh, i*(height61+dh), 0]) {
        up_stand1_61mm();
    }
}
for (i=[0:1:3]) {
    translate([2*(length61+dh), i*(height61+dh), 0]) {
        up_stand1_61mm();
    }
}
for (i=[0:1:3]) {
    translate([3*(length61+dh), i*(height61+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_61mm();
        }
    }
}
for (i=[0:1:3]) {
    translate([4*(length61+dh), i*(height61+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_61mm();
        }
    }
}
for (i=[0:1:3]) {
    translate([5*(length61+dh), i*(length61+dh), 0]) {
        up_lip_61mm();
    }
}
