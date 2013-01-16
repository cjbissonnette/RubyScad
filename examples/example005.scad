//created with rubyscad 1.0

translate(v = [0.000, 0.000, -120]) {
   difference() {
      cylinder(h = 50, r = 100); 
      translate(v = [0.000, 0.000, 10]) 
      cylinder(h = 50, r = 80); 
      translate(v = [100, 0, 35]) 
      cube(size = 50, center = true); 
   }
   echo(0, 0.000, 80.000);
   translate(v = [0.000, 80.000, 0]) 
   cylinder(h = 200, r = 10); 
   echo(60, 69.282, 40.000);
   translate(v = [69.282, 40.000, 0]) 
   cylinder(h = 200, r = 10); 
   echo(120, 69.282, -40.000);
   translate(v = [69.282, -40.000, 0]) 
   cylinder(h = 200, r = 10); 
   echo(180, 0.000, -80.000);
   translate(v = [0.000, -80.000, 0]) 
   cylinder(h = 200, r = 10); 
   echo(240, -69.282, -40.000);
   translate(v = [-69.282, -40.000, 0]) 
   cylinder(h = 200, r = 10); 
   echo(300, -69.282, 40.000);
   translate(v = [-69.282, 40.000, 0]) 
   cylinder(h = 200, r = 10); 
   translate(v = [0.000, 0.000, 200]) 
   cylinder(h = 80, r1 = 120, r2 = 0); 
}
