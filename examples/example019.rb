require "rubyscad"

module Example019
  extend RubyScad

  def self.get_cylinder_h(p)
    lookup(p, {
             -200=>5,
             -50=>20,
             -20=>18,
             80=>25,
             150=>2
           })
  end

  (-100..100).step(5) do |i|
    #echo(i, get_cylinder_h(i));
    translate(v: [ i, 0, -30 ]) 
    cylinder(r1: 6, r2: 2, h: get_cylinder_h(i)*3)
  end
end

