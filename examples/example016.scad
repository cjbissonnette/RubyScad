//created with rubyscad 1.0

difference() {
   cube(size = [65, 28, 28], center = true); 
   rotate(a = 0, v = [1, 0, 0]) 
   render(convexity = 12) 
   difference() {
      difference() {
         translate(v = [0, 0, 7.500]) 
         cube(size = [60, 28, 14], center = true); 
         cube(size = [8, 32, 32], center = true); 
      }
      translate(v = [-14, 0]) 
      import(file = "example016.stl", convexity = 12); 
   }
   rotate(a = 90, v = [1, 0, 0]) 
   render(convexity = 12) 
   difference() {
      difference() {
         translate(v = [0, 0, 7.500]) 
         cube(size = [60, 28, 14], center = true); 
         cube(size = [8, 32, 32], center = true); 
      }
      translate(v = [-14, 0]) 
      import(file = "example016.stl", convexity = 12); 
   }
   rotate(a = 180, v = [1, 0, 0]) 
   render(convexity = 12) 
   difference() {
      difference() {
         translate(v = [0, 0, 7.500]) 
         cube(size = [60, 28, 14], center = true); 
         cube(size = [8, 32, 32], center = true); 
      }
      translate(v = [-14, 0]) 
      import(file = "example016.stl", convexity = 12); 
   }
   rotate(a = 270, v = [1, 0, 0]) 
   render(convexity = 12) 
   difference() {
      difference() {
         translate(v = [0, 0, 7.500]) 
         cube(size = [60, 28, 14], center = true); 
         cube(size = [8, 32, 32], center = true); 
      }
      translate(v = [-14, 0]) 
      import(file = "example016.stl", convexity = 12); 
   }
}
