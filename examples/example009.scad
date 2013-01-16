//created with rubyscad 1.0

%linear_extrude(height = 0.000, center = true, convexity = 10) 
import(file = "example009.dxf", layer = "body"); 
%translate(v = [0, 0, 0.000]) 
linear_extrude(height = 0.000, center = true, convexity = 10) 
import(file = "example009.dxf", layer = "plate"); 
translate(v = [0, 0, -0.000]) 
linear_extrude(height = 0.000, center = true, convexity = 10) 
import(file = "example009.dxf", layer = "plate"); 
intersection() {
   linear_extrude(height = 0.000, center = true, convexity = 10, twist = -0.000) 
   import(file = "example009.dxf", layer = "fan_top"); 
   rotate_extrude(file = "example009.dxf", layer = "fan_side", origin = 0.000, convexity = 10); 
}
