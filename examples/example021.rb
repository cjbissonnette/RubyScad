load "../RubyScad.rb"

module Example021
  extend RubyScad

  def self.thing()
    fa 30
    difference() {
      sphere(r: 25)
      cylinder(h: 62.5, r1: 12.5, r2: 6.25, center: true)
      rotate(x: 90)
      cylinder(h: 62.5, r1: 12.5, r2: 6.25, center: true)
      rotate(y: 90)
      cylinder(h: 62.5, r1: 12.5, r2: 6.25, center: true)
    }
  end

  def self.demo_proj()
    linear_extrude(center: true, height: 0.5)
    projection(cut: false); thing()
    background; thing()
  end

  def self.demo_cut()
    (-20..+20).step(5) do |i|
      rotate(a: -30, v:[ 1, 1, 0 ]); translate(z: -i)
      linear_extrude(center: true, height: 0.5); projection(cut: true)
      translate(z: i); rotate(a: 30, v: [ 1, 1, 0 ]); thing()
    end
    background; thing()
  end

  translate(x: -30) {
    demo_proj()
  }
  translate(x: 30) {
    demo_cut()
  }
end
