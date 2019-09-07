dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;
lp_length = 30;
lp_height = 45;
lp_lip_length = 40;
length51 = 56;
width51 = 38;
inner_length51 = 45;
inner_width51 = 28.5;
height51 = 95;
module up_base_51mm(){//7*1
        difference(){
            square(size=[length51, width51], center=true);
            square(size=[lp_length, lp_length], center=true);
            translate([lp_lip_length/2-(lp_lip_length-lp_length)/4, 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
            translate([-(lp_lip_length/2-(lp_lip_length-lp_length)/4), 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
        }
}
module up_stand1_51mm(){//7*2
            square(size = [length51,height51],center = true);
}
module up_stand2_51mm(){//7*2
        square(size = [height51,width51-2*2],center = true);
}
module up_lip_51mm(){//7*1
        difference(){
            square(size = [length51,width51],center = true);
            square(size=[inner_length51, inner_width51], center=true);
        }
}

for (i=[0:1:6]) {
    translate([0, i*(length51+dh), 0]) {
        rotate([0,0,90]){
            up_base_51mm();
        }
    }
}
for (i=[0:1:6]) {
    translate([length51, i*(height51+dh), 0]) {
        up_stand1_51mm();
    }
}
for (i=[0:1:6]) {
    translate([2*(length51+dh), i*(height51+dh), 0]) {
        up_stand1_51mm();
    }
}
for (i=[0:1:6]) {
    translate([2.9*(length51+dh), i*(height51+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_51mm();
        }
    }
}
for (i=[0:1:6]) {
    translate([3.6*(length51+dh), i*(height51+dh), 0]) {
        rotate([0, 0, 90]) {
            up_stand2_51mm();
        }
    }
}
for (i=[0:1:6]) {
    translate([4.3*(length51+dh), i*(length51+dh), 0]) {
        rotate([0, 0, 90]) {
            up_lip_51mm();
        }
    }
}