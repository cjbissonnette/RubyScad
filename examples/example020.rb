require "rubyscad"

module Example020
  extend RubyScad
  extend Math

  def self.screw(type = 2, r1 = 15, r2 = 20, n = 7, h = 100, t = 8)
    linear_extrude(height: h, twist: 360*t/n, convexity: t)
    difference() {
      circle(r: r2)
      (0..n-1).each do |i|
        if (type == 1)
          rotate(a: i*360/n) 
          polygon(points: [
                           [ 2*r2, 0 ],
                           [ r2, 0 ],
                           [ r1*cos((180/n).radians), r1*sin((180/n).radians) ],
                           [ r2*cos((360/n).radians), r2*sin((360/n).radians) ],
                           [ 2*r2*cos((360/n).radians), 2*r2*sin((360/n).radians) ],
                          ])
        elsif (type == 2)
          rotate(a: i*360/n)
          polygon(points: [
                           [ 2*r2, 0 ],
                           [ r2, 0 ],
                           [ r1*cos((90/n).radians), r1*sin((90/n).radians) ],
                           [ r1*cos((180/n).radians), r1*sin((180/n).radians) ],
                           [ r2*cos((270/n).radians), r2*sin((270/n).radians) ],
                           [ 2*r2*cos((270/n).radians), 2*r2*sin((270/n).radians) ],
                          ])
        end
      end
    }
  end

  def self.nut(type = 2, r1 = 16, r2 = 21, r3 = 30, s = 6, n = 7, h = 100/5, t = 8/5)
    difference() {
      cylinder(fn: s, r: r3, h: h)
      translate(v: [ 0, 0, -h/2 ]); screw(type, r1, r2, n, h*2, t*2)
    }
  end

  def self.spring(r1 = 100.0, r2 = 10.0, h = 100.0, hr = 12.0)
    stepsize = 1.0/16.0

    segment = lambda do |i1, i2|
      alpha1 = i1 * 360*r2/hr
      alpha2 = i2 * 360*r2/hr
      len1 = sin(acos((i1*2-1).radians))*r2
      len2 = sin(acos((i2*2-1).radians))*r2
      if (len1 < 0.01)
        polygon(points: [
                         [ cos(alpha1.radians)*r1, sin(alpha1.radians)*r1 ],
                         [ cos(alpha2.radians)*(r1-len2), sin(alpha2.radians)*(r1-len2) ],
                         [ cos(alpha2.radians)*(r1+len2), sin(alpha2.radians)*(r1+len2) ]
                        ])
      end
      if (len2 < 0.01)
        polygon(points: [
                         [ cos(alpha1.radians)*(r1+len1), sin(alpha1.radians)*(r1+len1) ],
                         [ cos(alpha1.radians)*(r1-len1), sin(alpha1.radians)*(r1-len1) ],
                         [ cos(alpha2.radians)*r1, sin(alpha2.radians)*r1 ],
                        ])
      end
      if (len1 >= 0.01 && len2 >= 0.01)
        polygon(points: [
                         [ cos(alpha1.radians)*(r1+len1), sin(alpha1.radians)*(r1+len1) ],
                         [ cos(alpha1.radians)*(r1-len1), sin(alpha1.radians)*(r1-len1) ],
                         [ cos(alpha2.radians)*(r1-len2), sin(alpha2.radians)*(r1-len2) ],
                         [ cos(alpha2.radians)*(r1+len2), sin(alpha2.radians)*(r1+len2) ]
                        ])
      end
    end

    linear_extrude(height: 100, twist: 180*h/hr, fn: (hr/r2)/stepsize, convexity: 5) {
      (stepsize..1+stepsize/2).step(stepsize).each do |i|
        segment.call(i-stepsize, [i, 1].min)
      end
    }
  end


  translate(x: -30)
  screw()
  
  translate(x: 30)
  nut()

  spring()
end


