require "rubyscad"

module Example018
  extend RubyScad

  def self.step(len, mod, *objects)
    (0..objects.length-1).each do |i|
      translate(x: len*(i - (objects.length-1)/2))
      objects[(i+mod) % objects.length].call
    end
  end
  
  (1..4).each do |i|
    translate(y: -250+i*100) {
      step(100, i,
           proc {sphere(r: 30)},
           proc {cube(size: 60, center: true)},
           proc {  cylinder(r: 30, h: 50, center: true)},
           proc {
             union() {
               cube(size: 45, center: true);
               rotate(a: [45, 0, 0]); cube(size: 50, center: true);
               rotate(a: [0, 45, 0]); cube(size: 50, center: true);
               rotate(a: [0, 0, 45]); cube(size: 50, center: true);
             }
           })
    }
  end
end
