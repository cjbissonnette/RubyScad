//created with rubyscad 1.0

$fa = 30;
translate(v = [-30, 0]) {
   linear_extrude(center = true, height = 0.500) 
   projection(cut = false) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   %difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
}
translate(v = [30, 0]) {
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, 20]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, -20]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, 15]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, -15]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, 10]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, -10]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, 5]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, -5]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, 0]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, 0]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, -5]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, 5]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, -10]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, 10]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, -15]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, 15]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   rotate(a = -30, v = [1, 1, 0]) 
   translate(v = [0, 0, -20]) 
   linear_extrude(center = true, height = 0.500) 
   projection(cut = true) 
   translate(v = [0, 0, 20]) 
   rotate(a = 30, v = [1, 1, 0]) 
   difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
   %difference() {
      sphere(r = 25); 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [90, 0]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
      rotate(a = [0, 90]) 
      cylinder(h = 62.500, r1 = 12.500, r2 = 6.250, center = true); 
   }
}
