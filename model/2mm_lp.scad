dh = 2;
wirehole_radius = 5;
screwhole_radius = 0.8;

lp_length = 30;
lp_height = 45;
lp_lip_length = 40;

module lp_base(){//16*1
        difference(){
            square(size=[lp_length, lp_length], center=true);
            circle(r = wirehole_radius,$fn = 50);
        }
}
module lp_stand1(){//16*2
            square(size = [lp_length,lp_height],center = true);
}
module lp_stand2(){//16*2
        square(size = [lp_height,lp_length-2*dh],center = true);
}
module lp_lip(){//16*1
        difference(){
            square(size=[lp_lip_length, lp_length], center=true);
            circle(r = wirehole_radius,$fn = 50);
            translate([lp_lip_length/2-(lp_lip_length-lp_length)/4, 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
            translate([-(lp_lip_length/2-(lp_lip_length-lp_length)/4), 0, 0]) {
                circle(r=screwhole_radius,$fn = 50);                
            }
        }
}

for (i=[0:1:3]) {
    for (j=[0:1:3]) {
        translate([i*(lp_length+dh),j*(lp_length+dh), 0]) {
            lp_base();
        }
    }
}
for (i=[0:1:3]) {
    for (j=[0:1:3]) {
        translate([(i)*(lp_length+dh),4.5*(lp_length+dh)+(j)*(lp_height+dh), 0]) {
            lp_stand1();
        }
    }
}
for (i=[0:1:3]) {
    for (j=[0:1:3]) {
        translate([(i)*(lp_length+dh),4.5*(lp_length+dh)+(j+4)*(lp_height+dh), 0]) {
            lp_stand1();
        }
    }
}
for (i=[0:1:3]) {
    for (j=[0:1:3]) {
        translate([(i+4.2)*(lp_length),(j+0.2)*(lp_height+dh), 0]) {
            rotate([0, 0, 90]) {
                lp_stand2();
            }
        }
    }
}
for (i=[0:1:3]) {
    for (j=[0:1:3]) {
        translate([(i+4.2)*(lp_length),(j+4.2)*(lp_height+dh), 0]) {
            rotate([0, 0, 90]) {
                lp_stand2();
            }
        }
    }
}
for (i=[0:1:3]) {
    for (j=[0:1:3]) {
        translate([(i+4.2)*(lp_length+dh),(j+8.2)*(lp_height+dh), 0]) {
            rotate([0, 0, 90]) {
                lp_lip();
            }
        }
    }
}