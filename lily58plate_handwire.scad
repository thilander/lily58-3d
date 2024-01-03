// Higher definition curves
$fa = 8;
$fs = 0.4;

use <lily58plate_slot.scad>
use <module-bevelextrude.scad>


module boltHole() {
    translate([0, 0, 0]) cylinder(4, d=4);
}

module trrsJackMount() {
    difference() {
        union() {
            cube(size = [10, 8, 10]);
            translate([5, 0, 10]) rotate([0, 90, 90]) cylinder(h = 8, r = 5);
        }
        translate([5, 5.5, 10]) rotate([0, 90, 90]) cylinder(h = 2.5, r = 3);
        translate([5, 0, 10]) rotate([0, 90, 90]) cylinder(h = 5.5, r = 4);
    }
}

module plate() {
    pinHoleWidth = 2.7;
    difference() {
        y_cmp = 210;
        union() {
            // supports for the controller board
            translate([79+(29/2)-(15/2)+(pinHoleWidth/2)+pinHoleWidth, y_cmp-71+31-2, 5]) cube(size = [15-pinHoleWidth, 2, 1]);
            translate([79+(29/2)-(15/2)+(pinHoleWidth/2)+pinHoleWidth, y_cmp-71, 5]) cube(size = [15-pinHoleWidth, 2, 1]);
            // audio jack mount
            translate([94.1, y_cmp-36.2-45, 0]) rotate([0, 0, 90]) trrsJackMount();
            // plate
            translate([0, 0, 0]) bevel_extrude(5, bevel_depth=1) offset(0.8) import("lily58_BOTTOM-Frame.svg");
        }
        // Cutouts for microcontroller pins
        translate([79+(29/2)-(15/2)+(pinHoleWidth/2), y_cmp-71, 0]) cube(size = [pinHoleWidth, 31, 5]);
        translate([79+(29/2)+(15/2)+(pinHoleWidth/2), y_cmp-71, 0]) cube(size = [pinHoleWidth, 31, 5]);
        // Cover mount holes
        translate([79+(29/2)-(15/2)+(5/2), y_cmp-84, 0]) cylinder(5, d=4);
        translate([79+(29/2)+(15/2)+(5/2), y_cmp-84, 0]) cylinder(5, d=4);
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
        // Bolt holes
        translate([105, y_cmp-114.8, 0]) boltHole();
        translate([129.6, y_cmp-59.6, 0]) boltHole();
        translate([129.6, y_cmp-97.6, 0]) boltHole();
        translate([205.8, y_cmp-61.8, 0]) boltHole();
        translate([205.8, y_cmp-100, 0]) boltHole();
    }
}

// Correction: 0% infill, PETG, Rev 1
scale(1.007, 1.007) plate();
// Correction: 0% infill, PETG
//scale([1.004, 1.004, 0.004]) plate();
