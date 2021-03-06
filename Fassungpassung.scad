durchmesser_lampenfassung = 39.8;

module Birne() {
    d = 64;
    h = 147;
    translate([0, 0, h-d/2]) sphere(d=d, $fn=64);
    translate([0, 0, 28]) cylinder(d1=27, d2=27+4, h=3, $fn=64);
    translate([0, 0, 31]) cylinder(d1=27+4, d2=d, h=h-d/2-28-3-1.5, $fn=64);
    cylinder(d1=7, d2=12, h=2, $fn=64);
    translate([0, 0, 2]) cylinder(d1=27-6, d2=27, h=6, $fn=64);
    translate([0, 0, 8]) cylinder(d=27, h=20, $fn=64);
}

module Fassungspassung(innendurchmesser, breite, dicke) {
    difference() {
        cylinder(d=innendurchmesser+breite, h=dicke, $fn=4*4);
        translate([0, 0, -1]) cylinder(d=innendurchmesser, h=dicke+2, $fn=32*4);
    }
    for(i=[0, 1, 2, 3]) {
        rotate([0, 0, 45+i*90]) translate([innendurchmesser/2+breite/4, -1*dicke, 0]) cube([breite/4, 2*dicke, dicke]);
    }
}

//color("white") translate([0, 0, -15]) Birne();
Fassungspassung(durchmesser_lampenfassung, 20, 12.5/2);