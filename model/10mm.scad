difference(){
    circle(r=160/2,$fn = 50);
    difference(){
        circle(r=5.7/2,$fn = 50);
        translate([5.7/2, 0, 0]) {
            square(size=[1.4*2, 5.7], center=true);
        }
    }
}