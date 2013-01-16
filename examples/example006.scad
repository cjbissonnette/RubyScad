//created with rubyscad 1.0

difference() {
   cube(size = 100, center = true); 
   rotate(a = 90, v = [0, 0, 0]) {
      translate(v = [50, 50, 0]) 
      rotate(a = 0, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [-50, 50, 0]) 
      rotate(a = 90, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [-50, -50, 0]) 
      rotate(a = 180, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [50, -50, 0]) 
      rotate(a = 270, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
   }
   rotate(a = 90, v = [1, 0, 0]) {
      translate(v = [50, 50, 0]) 
      rotate(a = 0, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [-50, 50, 0]) 
      rotate(a = 90, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [-50, -50, 0]) 
      rotate(a = 180, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [50, -50, 0]) 
      rotate(a = 270, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
   }
   rotate(a = 90, v = [0, 1, 0]) {
      translate(v = [50, 50, 0]) 
      rotate(a = 0, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [-50, 50, 0]) 
      rotate(a = 90, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [-50, -50, 0]) 
      rotate(a = 180, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
      translate(v = [50, -50, 0]) 
      rotate(a = 270, v = [0, 0, 1]) 
      render(convexity = 2) 
      difference() {
         cube(size = [20, 20, 150], center = true); 
         translate(v = [-10, -10, 0]) 
         cylinder(h = 80, r = 10, center = true); 
         translate(v = [-10, -10, 40]) 
         sphere(r = 10); 
         translate(v = [-10, -10, -40]) 
         sphere(r = 10); 
      }
   }
   rotate(a = 0, v = [0, 0, 1]) 
   rotate(a = 0, v = [1, 0, 0]) 
   translate(v = [0.000, -50]) {
      translate(v = [0, 0, 0]) 
      sphere(r = 10); 
   }
   rotate(a = 90, v = [0, 0, 1]) 
   rotate(a = 0, v = [1, 0, 0]) 
   translate(v = [0.000, -50]) {
      translate(v = [-20, 0, -20]) 
      sphere(r = 10); 
      translate(v = [20, 0, 20]) 
      sphere(r = 10); 
   }
   rotate(a = 180, v = [0, 0, 1]) 
   rotate(a = 0, v = [1, 0, 0]) 
   translate(v = [0.000, -50]) {
      translate(v = [-20, 0, -25]) 
      sphere(r = 10); 
      translate(v = [-20, 0, 0]) 
      sphere(r = 10); 
      translate(v = [-20, 0, 25]) 
      sphere(r = 10); 
      translate(v = [20, 0, -25]) 
      sphere(r = 10); 
      translate(v = [20, 0, 0]) 
      sphere(r = 10); 
      translate(v = [20, 0, 25]) 
      sphere(r = 10); 
   }
   rotate(a = 270, v = [0, 0, 1]) 
   rotate(a = 0, v = [1, 0, 0]) 
   translate(v = [0.000, -50]) {
      translate(v = [0, 0, 0]) 
      sphere(r = 10); 
      translate(v = [-25, 0, -25]) 
      sphere(r = 10); 
      translate(v = [25, 0, -25]) 
      sphere(r = 10); 
      translate(v = [-25, 0, 25]) 
      sphere(r = 10); 
      translate(v = [25, 0, 25]) 
      sphere(r = 10); 
   }
   rotate(a = 0, v = [0, 0, 1]) 
   rotate(a = 90, v = [1, 0, 0]) 
   translate(v = [0.000, -50]) {
      translate(v = [-25, 0, -25]) 
      sphere(r = 10); 
      translate(v = [0, 0, 0]) 
      sphere(r = 10); 
      translate(v = [25, 0, 25]) 
      sphere(r = 10); 
   }
   rotate(a = 0, v = [0, 0, 1]) 
   rotate(a = -90, v = [1, 0, 0]) 
   translate(v = [0.000, -50]) {
      translate(v = [-25, 0, -25]) 
      sphere(r = 10); 
      translate(v = [25, 0, -25]) 
      sphere(r = 10); 
      translate(v = [-25, 0, 25]) 
      sphere(r = 10); 
      translate(v = [25, 0, 25]) 
      sphere(r = 10); 
   }
}
