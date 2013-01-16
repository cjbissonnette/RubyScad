//created with rubyscad 1.0

intersection() {
   surface(file = "example010.dat", center = true, convexity = 5); 
   rotate(a = [0, 0, 45]) 
   surface(file = "example010.dat", center = true, convexity = 5); 
}
