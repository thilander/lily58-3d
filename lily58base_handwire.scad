// Higher definition curves
$fa = 8;
$fs = 0.4;

tilted = false;

use <module-bevelextrude.scad>


module bolt() {
    translate([0, 0, -2]) cylinder(h=8, d=3);
    // translate([0, 0, -2]) cylinder(h=6, d=3);
    translate([0, 0, -1]) cylinder(h=4, d=6);
}

module threadedInserts() {
    translate([0, 0, -2]) cylinder(h=4, d=4);
}

module boltPillar() {
    difference() {
        translate([0, 0, 5-1]) cylinder(h=5, d=6);
        translate([0, 0, -2]) cylinder(h=20, d=3);
    }
}

module base() {
    difference() {
        y_cmp = 210;
        union() {
            // Bolt pillars
            translate([105, y_cmp-114.8, -4]) boltPillar();
            translate([129.6, y_cmp-59.6, -4]) boltPillar();
            translate([129.6, y_cmp-97.6, -4]) boltPillar();
            translate([205.8, y_cmp-61.8, -4]) boltPillar();
            translate([205.8, y_cmp-100, -4]) boltPillar();
            translate([0, 0, -5]) bevel_extrude(5, bevel_depth=1, bottom=true) offset(0.8) import("lily58_BOTTOM-Frame.svg");
        }
        // Bolts
        translate([105, y_cmp-114.8, -4]) bolt();
        translate([129.6, y_cmp-59.6, -4]) bolt();
        translate([129.6, y_cmp-97.6, -4]) bolt();
        translate([205.8, y_cmp-61.8, -4]) bolt();
        translate([205.8, y_cmp-100, -4]) bolt();
    }
}

// Correction: 0% infill, PETG, Rev 1
scale([1.007, 1.007, 1.007]) base();
//scale(1.007, 1.007) base();
// Correction: 0% infill, PETG
//scale([1.004, 1.004, 0.004]) base();
