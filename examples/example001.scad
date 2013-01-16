//created with rubyscad 1.0

difference() {
   sphere(r = 25.000); 
   rotate(a = 90, v = [0, 0, 0]) 
   cylinder(r = 12.500, h = 62.500, center = true); 
   rotate(a = 90, v = [1, 0, 0]) 
   cylinder(r = 12.500, h = 62.500, center = true); 
   rotate(a = 90, v = [0, 1, 0]) 
   cylinder(r = 12.500, h = 62.500, center = true); 
}
