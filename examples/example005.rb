require "rubyscad"

module Example005
  extend RubyScad

  translate(z: -120) {
    difference() {
      cylinder(h: 50, r: 100)
      translate(z: 10); cylinder(h: 50, r: 80)
      translate(v: [100, 0, 35]); cube(size: 50, center: true)
    }

    (0..5).each do |i|
      echo(360*i/6, Math.sin((360*i/6).radians)*80, Math.cos((360*i/6).radians)*80)
      translate(v:[Math.sin((360*i/6).radians)*80, Math.cos((360*i/6).radians)*80, 0])
      cylinder(h: 200, r: 10)
    end

    translate(z: 200)
    cylinder(h: 80, r1: 120, r2: 0)
  }
end
