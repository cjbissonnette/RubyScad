//created with rubyscad 1.0

difference() {
   union() {
      cube(size = 30, center = true); 
      cube(size = [40, 15, 15], center = true); 
      cube(size = [15, 40, 15], center = true); 
      cube(size = [15, 15, 40], center = true); 
   }
   union() {
      cube(size = [50, 10, 10], center = true); 
      cube(size = [10, 50, 10], center = true); 
      cube(size = [10, 10, 50], center = true); 
   }
}
