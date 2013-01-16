//created with rubyscad 1.0

difference() {
   sphere(r = 20); 
   translate(v = [-2.920, 0.500, 20]) 
   rotate(a = [180, 0, 180]) 
   import(file = "example012.stl", convexity = 5); 
}
