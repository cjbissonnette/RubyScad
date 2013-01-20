require 'rubyscad'

module Example002
  extend RubyScad

  intersection() {
    difference() {
      union() {
        cube(size: 30, center: true)
        translate(z:-25)
        cube(size: [15, 15, 50], center: true)
      }
      union() {
        cube(size: [50, 10, 10], center: true)
        cube(size: [10, 50, 10], center: true)
        cube(size: [10, 10, 50], center: true)
      }
    }
    translate(z: 5)
    cylinder(h: 50, r1: 20, r2: 5, center: true)
  }
end

