//created with rubyscad 1.0

translate(v = [0, 0, -10]) 
difference() {
   rotate_extrude(convexity = 3, file = "example007.dxf", layer = "dorn"); 
   rotate(a = [0, 0, 0]) 
   intersection() {
      rotate(a = 90, v = [1, 0, 0]) 
      translate(v = [0, 0, -50]) 
      linear_extrude(height = 100, convexity = 1) 
      import(file = "example007.dxf", layer = "cutout1"); 
      rotate(a = 90, v = [0, 0, 1]) 
      rotate(a = 90, v = [1, 0, 0]) 
      translate(v = [0, 0, -50]) 
      linear_extrude(height = 100, convexity = 2) 
      import(file = "example007.dxf", layer = "cutout2"); 
   }
   rotate(a = [0, 0, 90]) 
   intersection() {
      rotate(a = 90, v = [1, 0, 0]) 
      translate(v = [0, 0, -50]) 
      linear_extrude(height = 100, convexity = 1) 
      import(file = "example007.dxf", layer = "cutout1"); 
      rotate(a = 90, v = [0, 0, 1]) 
      rotate(a = 90, v = [1, 0, 0]) 
      translate(v = [0, 0, -50]) 
      linear_extrude(height = 100, convexity = 2) 
      import(file = "example007.dxf", layer = "cutout2"); 
   }
}
