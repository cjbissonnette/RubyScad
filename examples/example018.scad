//created with rubyscad 1.0

translate(v = [0, -150]) {
   translate(v = [-100, 0]) 
   cube(size = 60, center = true); 
   translate(v = [0, 0]) 
   cylinder(r = 30, h = 50, center = true); 
   translate(v = [100, 0]) 
   union() {
      cube(size = 45, center = true); 
      rotate(a = [45, 0, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 45, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 0, 45]) 
      cube(size = 50, center = true); 
   }
   translate(v = [200, 0]) 
   sphere(r = 30); 
}
translate(v = [0, -50]) {
   translate(v = [-100, 0]) 
   cylinder(r = 30, h = 50, center = true); 
   translate(v = [0, 0]) 
   union() {
      cube(size = 45, center = true); 
      rotate(a = [45, 0, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 45, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 0, 45]) 
      cube(size = 50, center = true); 
   }
   translate(v = [100, 0]) 
   sphere(r = 30); 
   translate(v = [200, 0]) 
   cube(size = 60, center = true); 
}
translate(v = [0, 50]) {
   translate(v = [-100, 0]) 
   union() {
      cube(size = 45, center = true); 
      rotate(a = [45, 0, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 45, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 0, 45]) 
      cube(size = 50, center = true); 
   }
   translate(v = [0, 0]) 
   sphere(r = 30); 
   translate(v = [100, 0]) 
   cube(size = 60, center = true); 
   translate(v = [200, 0]) 
   cylinder(r = 30, h = 50, center = true); 
}
translate(v = [0, 150]) {
   translate(v = [-100, 0]) 
   sphere(r = 30); 
   translate(v = [0, 0]) 
   cube(size = 60, center = true); 
   translate(v = [100, 0]) 
   cylinder(r = 30, h = 50, center = true); 
   translate(v = [200, 0]) 
   union() {
      cube(size = 45, center = true); 
      rotate(a = [45, 0, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 45, 0]) 
      cube(size = 50, center = true); 
      rotate(a = [0, 0, 45]) 
      cube(size = 50, center = true); 
   }
}
