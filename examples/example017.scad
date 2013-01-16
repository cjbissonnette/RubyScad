//created with rubyscad 1.0

translate(v = [0, 0, 92.000]) 
linear_extrude(height = 6.000, convexity = 4) 
difference() {
   circle(r = 47.000); 
   rotate(a = 0) 
   translate(v = [0, 36.000]) 
   square(size = [6.000, 10.000], center = true); 
   circle(r = 25.000); 
   rotate(a = 120) 
   translate(v = [0, 36.000]) 
   square(size = [6.000, 10.000], center = true); 
   circle(r = 25.000); 
   rotate(a = 240) 
   translate(v = [0, 36.000]) 
   square(size = [6.000, 10.000], center = true); 
   circle(r = 25.000); 
}
linear_extrude(height = 6.000, convexity = 4) 
difference() {
   circle(r = 102.000); 
   rotate(a = 0) 
   translate(v = [0, 88.500]) 
   square(size = [6.000, 15.000], center = true); 
   circle(r = 75.000); 
   rotate(a = 120) 
   translate(v = [0, 88.500]) 
   square(size = [6.000, 15.000], center = true); 
   circle(r = 75.000); 
   rotate(a = 240) 
   translate(v = [0, 88.500]) 
   square(size = [6.000, 15.000], center = true); 
   circle(r = 75.000); 
}
color(c = [0.700, 0.700, 1], color = [0, 0, 0, 1]) {
   rotate(a = 0) 
   translate(v = [0, 102.000, 9.000]) 
   rotate(a = [90, 0, -90]) 
   linear_extrude(height = 6.000, convexity = 10, center = true) 
   union() {
      difference() {
         polygon(points = [[0, 6.000], [6.000, 6.000], [6.000, 0], [21.000, 0], [21.000, 6.000], [27.000, 6.000], [27.000, 0], [77.000, 0], [83.000, 12.000], [77.000, 18.000], [77.000, 74.000], [71.000, 74.000], [71.000, 80.000], [61.000, 80.000], [61.000, 74.000], [55.000, 74.000], [55.000, 80.000], [49.000, 74.000], [49.000, 18.000], [43.000, 12.000], [6.000, 12.000]]); 
         translate(v = [43.000, 18.000]) 
         circle(r = 6.000); 
         translate(v = [83.000, 18.000]) 
         circle(r = 6.000); 
      }
      translate(v = [77.000, 0]) 
      square(size = [9.000, 12.000]); 
      translate(v = [86.000, 6.000]) 
      circle(r = 6.000); 
      translate(v = [6.000, 6.000]) 
      intersection() {
         circle(r = 6.000); 
         translate(v = [-12.000, 0]) 
         square(size = 12.000); 
      }
      translate(v = [55.000, 74.000]) 
      intersection() {
         circle(r = 6.000); 
         translate(v = [-12.000, 0]) 
         square(size = 12.000); 
      }
   }
   rotate(a = 120) 
   translate(v = [0, 102.000, 9.000]) 
   rotate(a = [90, 0, -90]) 
   linear_extrude(height = 6.000, convexity = 10, center = true) 
   union() {
      difference() {
         polygon(points = [[0, 6.000], [6.000, 6.000], [6.000, 0], [21.000, 0], [21.000, 6.000], [27.000, 6.000], [27.000, 0], [77.000, 0], [83.000, 12.000], [77.000, 18.000], [77.000, 74.000], [71.000, 74.000], [71.000, 80.000], [61.000, 80.000], [61.000, 74.000], [55.000, 74.000], [55.000, 80.000], [49.000, 74.000], [49.000, 18.000], [43.000, 12.000], [6.000, 12.000]]); 
         translate(v = [43.000, 18.000]) 
         circle(r = 6.000); 
         translate(v = [83.000, 18.000]) 
         circle(r = 6.000); 
      }
      translate(v = [77.000, 0]) 
      square(size = [9.000, 12.000]); 
      translate(v = [86.000, 6.000]) 
      circle(r = 6.000); 
      translate(v = [6.000, 6.000]) 
      intersection() {
         circle(r = 6.000); 
         translate(v = [-12.000, 0]) 
         square(size = 12.000); 
      }
      translate(v = [55.000, 74.000]) 
      intersection() {
         circle(r = 6.000); 
         translate(v = [-12.000, 0]) 
         square(size = 12.000); 
      }
   }
   rotate(a = 240) 
   translate(v = [0, 102.000, 9.000]) 
   rotate(a = [90, 0, -90]) 
   linear_extrude(height = 6.000, convexity = 10, center = true) 
   union() {
      difference() {
         polygon(points = [[0, 6.000], [6.000, 6.000], [6.000, 0], [21.000, 0], [21.000, 6.000], [27.000, 6.000], [27.000, 0], [77.000, 0], [83.000, 12.000], [77.000, 18.000], [77.000, 74.000], [71.000, 74.000], [71.000, 80.000], [61.000, 80.000], [61.000, 74.000], [55.000, 74.000], [55.000, 80.000], [49.000, 74.000], [49.000, 18.000], [43.000, 12.000], [6.000, 12.000]]); 
         translate(v = [43.000, 18.000]) 
         circle(r = 6.000); 
         translate(v = [83.000, 18.000]) 
         circle(r = 6.000); 
      }
      translate(v = [77.000, 0]) 
      square(size = [9.000, 12.000]); 
      translate(v = [86.000, 6.000]) 
      circle(r = 6.000); 
      translate(v = [6.000, 6.000]) 
      intersection() {
         circle(r = 6.000); 
         translate(v = [-12.000, 0]) 
         square(size = 12.000); 
      }
      translate(v = [55.000, 74.000]) 
      intersection() {
         circle(r = 6.000); 
         translate(v = [-12.000, 0]) 
         square(size = 12.000); 
      }
   }
}
