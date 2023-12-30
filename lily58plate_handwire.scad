// Higher definition curves
$fa = 8;
$fs = 0.4;

use <lily58plate_slot.scad>
use <module-bevelextrude.scad>


module bolt() {
    translate([0, 0, 0]) cylinder(4, d=4);
}

module trrsJackMount() {
    difference() {
        union() {
            cube(size = [10, 2.5, 10]);
            translate([5, 0, 10]) rotate([0, 90, 90]) cylinder(h = 2.5, r = 5);
        }
        translate([5, 0, 10]) rotate([0, 90, 90]) cylinder(h = 3, r = 3);
    }
}

module plate() {
    difference() {
        y_cmp = 210;
        union() {
            translate([83, y_cmp-38.2-10, 0]) trrsJackMount();
            translate([0, -2, 0]) bevel_extrude(5, bevel_depth=1) offset(0.8) import("lily58_BOTTOM-Frame.svg");
        }
        // Cutouts for microcontroller pins
        // translate([82, y_cmp-78, 0]) cube(size = [4,35, 5]);
        
        // Keys
        translate([101.4, y_cmp-97.5, 0]) slot_negative();
        translate([105, y_cmp-127, 0]) rotate([0, 0, -60]) slot_negative();
        translate([120.5, y_cmp-50, 0]) slot_negative();
        translate([120.5, y_cmp-69.1, 0]) slot_negative();
        translate([120.5, y_cmp-88.1, 0]) slot_negative();
        translate([120.5, y_cmp-107.1, 0]) slot_negative();
        translate([139.5, y_cmp-47.6, 0]) slot_negative();
        translate([139.5, y_cmp-66.7, 0]) slot_negative();
        translate([139.5, y_cmp-85.7, 0]) slot_negative();
        translate([139.5, y_cmp-104.8, 0]) slot_negative();
        translate([158.6, y_cmp-46.21, 0]) slot_negative();
        translate([158.6, y_cmp-65.3, 0]) slot_negative();
        translate([158.6, y_cmp-84.4, 0]) slot_negative();
        translate([158.6, y_cmp-103.4, 0]) slot_negative();
        translate([177.6, y_cmp-47.6, 0]) slot_negative();
        translate([177.6, y_cmp-66.6, 0]) slot_negative();
        translate([177.6, y_cmp-85.7, 0]) slot_negative();
        translate([177.6, y_cmp-104.8, 0]) slot_negative();
        translate([196.7, y_cmp-52.4, 0]) slot_negative();
        translate([196.7, y_cmp-71.3, 0]) slot_negative();
        translate([196.7, y_cmp-90.5, 0]) slot_negative();
        translate([196.7, y_cmp-109.5, 0]) slot_negative();
        translate([215.7, y_cmp-53.9, 0]) slot_negative();
        translate([215.7, y_cmp-72.8, 0]) slot_negative();
        translate([215.7, y_cmp-92, 0]) slot_negative();
        translate([215.7, y_cmp-111, 0]) slot_negative();
        translate([130, y_cmp-126, 0]) slot_negative();
        translate([149, y_cmp-123.75, 0]) slot_negative();
        translate([168.1, y_cmp-123.75, 0]) slot_negative();
        
        // Bolts
        translate([105, y_cmp-114.8, 0]) bolt();
        translate([129.6, y_cmp-59.6, 0]) bolt();
        translate([129.6, y_cmp-97.6, 0]) bolt();
        translate([205.8, y_cmp-61.8, 0]) bolt();
        translate([205.8, y_cmp-100, 0]) bolt();
    }
}

// Correction: 0% infill, PETG, Rev 1
scale(1.007, 1.007) plate();
// Correction: 0% infill, PETG
//scale([1.004, 1.004, 0.004]) plate();
