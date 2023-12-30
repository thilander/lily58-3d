// Higher definition curves
$fa = 8;
$fs = 0.4;

tilted = false;

use <module-bevelextrude.scad>


module bolt() {
    translate([0, 0, -5]) cylinder(h=11, d=3.5);
    // translate([0, 0, -2]) cylinder(h=6, d=3);
    translate([0, 0, -4]) cylinder(h=2, d=6);
}

module threadedInserts() {
    translate([0, 0, -2]) cylinder(h=4, d=4);
}

module controllerPlatform() {

}

module boltPillar() {
    difference() {
        translate([0, 0, 0]) cylinder(h=5, d=6);
        translate([0, 0, -2]) cylinder(h=20, d=3);
    }
}

module electronicsMount() {

}

module base() {
    difference() {
        y_cmp = 210;
        
        union() {
            // Bolt pillars
            translate([105, y_cmp-114.8, -5]) boltPillar();
            translate([129.6, y_cmp-59.6, -5]) boltPillar();
            translate([129.6, y_cmp-97.6, -5]) boltPillar();
            translate([205.8, y_cmp-61.8, -5]) boltPillar();
            translate([205.8, y_cmp-100, -5]) boltPillar();
            // Base plate
            difference() {
                translate([0, 0, -8]) bevel_extrude(8, bevel_depth=1, bottom=true) offset(0.8) import("lily58_BOTTOM-Frame.svg");
                translate([0, -2, -5]) linear_extrude(6) offset(-2.2) import("lily58_TOP-Frame.svg");
                // translate([0, 0, -5]) linear_extrude(6) offset(-2.2) import("lily58_BOTTOM-Frame.svg");
                translate([0, 0, 0]) linear_extrude(6) offset(-0.8) import("lily58_TOP-Frame.svg");
            }

            electronicsMount();
        }
        // Controller
        // translate([54+28, y_cmp-61-36, -5]) cube([28, 61, 5]);

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
