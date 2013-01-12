load "../RubyScad.rb"

module Example013
  extend RubyScad

  intersection() {
    linear_extrude(height: 100, center: true, convexity: 3)
    import(file: "example013.dxf");
    rotate(a: [0, 90, 0])
    linear_extrude(height: 100, center: true, convexity: 3)
    import(file: "example013.dxf");
    rotate(a: [90, 0, 0])
    linear_extrude(height: 100, center: true, convexity: 3)
    import(file: "example013.dxf");
  }
end
