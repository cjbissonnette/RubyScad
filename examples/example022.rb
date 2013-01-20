require "rubyscad"
require 'matrix'

module Example022
  extend RubyScad

  def self.roundedBox(size, radius, sidesonly)
    rot = [ [0,0,0], [90,0,90], [90,90,0] ]
    if (sidesonly)
      cube(size: (size - Vector[2*radius,0,0]), center: true)
      cube(size: (size - Vector[0,2*radius,0]), center: true)
      [radius-size[0]/2, -radius+size[0]/2].each do |x|
        [radius-size[1]/2, -radius+size[1]/2].each do |y|
          translate(x: x, y: y); cylinder(r: radius, h: size[2], center: true)
        end
      end
    else
      cube(size: [size[0], size[1]-radius*2, size[2]-radius*2], center: true)
      cube(size: [size[0]-radius*2, size[1], size[2]-radius*2], center: true)
      cube(size: [size[0]-radius*2, size[1]-radius*2, size[2]], center: true)
      
      (0..2).each do |axis|
        [radius-size[axis]/2, -radius+size[axis]/2].each do |x|
          [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2].each do |y|
            rotate(a: rot[axis]) 
            translate(v: [x,y,0]) 
            cylinder(h: size[(axis+2)%3]-2*radius, r: radius, center: true)
          end
        end
        [radius-size[0]/2, -radius+size[0]/2].each do |x|
          [radius-size[1]/2, -radius+size[1]/2].each do |y|
            [radius-size[2]/2, -radius+size[2]/2].each do |z|
              translate(v: [x,y,z]); sphere(r: radius)
            end
          end
        end
      end
    end
  end

  translate(v: [-15,0,0]) { roundedBox(Vector[20.0,30.0,40.0], 5.0, true) }
  translate(v:[15,0,0]) { roundedBox(Vector[20.0,30.0,40.0], 5, false) }
end

