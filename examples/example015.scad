//created with rubyscad 1.0

difference() {
   translate(v = [-35, -35]) 
   intersection() {
      union() {
         difference() {
            square(size = 100, center = true); 
            square(size = 50, center = true); 
         }
         translate(v = [50, 50]) 
         square(size = 15, center = true); 
      }
      rotate(a = 45) 
      translate(v = [0, -15]) 
      square(size = [100, 30]); 
   }
   rotate(a = -45) 
   scale(v = [0.700, 1.300]) 
   circle(r = 5); 
}
import(file = "example009.dxf", layer = "body", convexity = 6, scale = 2); 
