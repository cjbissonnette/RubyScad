load "../RubyScad.rb"

module Example008
  extend RubyScad

  difference() {
    intersection() {
      translate(v: [ -25, -25, -25])
      linear_extrude(height: 50, convexity: 3)
      import(file: "example008.dxf", layer: "G");
      
      rotate(a:90, v:[1, 0, 0])
      translate(v: [ -25, -125, -25])
      linear_extrude(height: 50, convexity: 3)
      import(file: "example008.dxf", layer: "E");
      
      rotate(a: 90, v: [0, 1, 0])
      translate(v: [ -125, -125, -25])
      linear_extrude(height: 50, convexity: 3)
      import(file: "example008.dxf", layer: "B");
    }
    
    intersection() {
      translate(v: [ -125, -25, -26])
      linear_extrude(height: 52, convexity: 1)
      import(file: "example008.dxf", layer: "X");
      
      rotate(a: 90, v:[0, 1, 0])
      translate(v: [ -125, -25, -26])
      linear_extrude(height: 52, convexity: 1)
      import(file: "example008.dxf", layer: "X");
    }
  }
end
