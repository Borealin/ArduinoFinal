inner_radius_re = 8.5/2;
module disc_base() {
    difference(){
        circle(r=180/2,$fn = 1000);
        circle(r=inner_radius_re-0.2);
    }
}
module disc() {
        difference(){
            circle(r=160/2,$fn = 1000);
            difference(){
                circle(r=5.7/2,$fn = 1000);
                translate([5.7/2, 0, 0]) {
                    square(size=[1.4*2, 5.7], center=true);
                }
            }
        }
}
for(i=[0:1:1]){
    translate([0,i*(160),0]){
        disc();
    }
}
for(i=[0:1:1]){
    translate([170,i*(180),0]){
        disc_base();
    }
}