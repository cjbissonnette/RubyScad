load "../RubyScad.rb"

module Example010
  extend RubyScad

  intersection() {
    surface(file: "example010.dat", center: true, convexity: 5)
    
    rotate(z: 45)
    surface(file: "example010.dat", center: true, convexity: 5)
  }
end
