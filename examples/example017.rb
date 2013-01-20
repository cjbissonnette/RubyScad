require "rubyscad"

class Example017
  include RubyScad

  def initialize(args={})
    #:parts, :exploded, :assembled
    @mode = args.fetch(:mode, "parts")

    @thickness = 6.0
    @locklen1 = 15.0
    @locklen2 = 10.0
    @boltlen = 15.0
    @midhole = 10.0
    @inner1_to_inner2 = 50.0
    @total_height = 80.0
  end

  def shape_tripod()
    x1 = 0
    x2 = x1 + @thickness
    x3 = x2 + @locklen1
    x4 = x3 + @thickness
    x5 = x4 + @inner1_to_inner2
    x6 = x5 - @thickness
    x7 = x6 - @locklen2
    x8 = x7 - @thickness
    x9 = x8 - @thickness
    x10 = x9 - @thickness
    
    y1 = 0
    y2 = y1 + @thickness
    y3 = y2 + @thickness
    y4 = y3 + @thickness
    y5 = y3 + @total_height - 3*@thickness
    y6 = y5 + @thickness
    
    union() {
      difference() {
        polygon(points: 
                [
                 [ x1, y2 ], [ x2, y2 ],
                 [ x2, y1 ], [ x3, y1 ], [ x3, y2 ],
                 [ x4, y2 ], [ x4, y1 ], [ x5, y1 ],
                 [ x5 + @thickness, y3 ], [ x5, y4 ],
                 [ x5, y5 ],
                 [ x6, y5 ], [ x6, y6 ], [ x7, y6 ], [ x7, y5 ], [ x8, y5 ],
                 [ x8, y6 ], [ x9, y5 ],
                 [ x9, y4 ], [ x10, y3 ],
                 [ x2, y3 ]
                ])
        translate(v: [ x10, y4 ]); circle(r: @thickness)
        translate(v: [ x5 + @thickness, y4 ]); circle(r: @thickness)
      }
      
      translate(v: [ x5, y1 ])
      square(size: [ @boltlen - @thickness, @thickness*2 ])
	
      translate(v: [ x5 + @boltlen - @thickness, y2 ]); circle(r:@thickness)
      
      translate(v: [ x2, y2 ])
      intersection() {
        circle(r: @thickness);
        translate(v: [ -@thickness*2, 0 ]); square(size: @thickness*2)
      }
      
      translate(v: [ x8, y5 ])
      intersection() {
        circle(r: @thickness);
        translate(v: [ -@thickness*2, 0 ]); square(size: @thickness*2)
      }
    }
  end
  
  def shape_inner_disc()
    difference() {
      circle(r: @midhole + @boltlen + 2*@thickness + @locklen2);
      [ 0, 120, 240 ].each do |alpha|
        rotate(a: alpha)
        translate(v: [ 0, @midhole + @boltlen + @thickness + @locklen2/2 ])
        square(size: [ @thickness, @locklen2 ], center: true)
        circle(r: @midhole + @boltlen)
      end
    }
  end

  def shape_outer_disc()
    difference() {
      circle(r: @midhole + @boltlen + @inner1_to_inner2 + 2*@thickness + @locklen1)
      [ 0, 120, 240 ].each do |alpha|
        rotate(a: alpha)
        translate(v: [ 0, @midhole + @boltlen + @inner1_to_inner2 + @thickness + @locklen1/2 ])
        square(size: [ @thickness, @locklen1 ], center: true)
        circle(r: @midhole + @boltlen + @inner1_to_inner2)
      end
    }
  end

  def parts()
    tripod_x_off = @locklen1 - @locklen2 + @inner1_to_inner2
    tripod_y_off = [@midhole + @boltlen + @inner1_to_inner2 + 4*@thickness + @locklen1, @total_height].max
    shape_inner_disc()
    shape_outer_disc()
    
    [ [1,1], [-1,1], [1,-1] ].each do |s|
      scale(v: s); translate(v: [ tripod_x_off, -tripod_y_off ]); shape_tripod()
    end
  end

  def exploded()
    translate(v: [ 0, 0, @total_height + 2*@thickness ])
    linear_extrude(height: @thickness, convexity: 4)
    shape_inner_disc()
    linear_extrude(height: @thickness, convexity: 4); shape_outer_disc()

    color(c: [ 0.7, 0.7, 1 ]) {
      [ 0, 120, 240 ].each do |alpha|
        rotate(a: alpha)
        translate(v: [ 0, @thickness*2 + @locklen1 + @inner1_to_inner2 + @boltlen + @midhole, 1.5*@thickness ])
        rotate(a: [ 90, 0, -90 ])
        linear_extrude(height: @thickness, convexity: 10, center: true); shape_tripod()
      end
    }
  end

  def bottle()
    r = @boltlen + @midhole;
    h = @total_height - @thickness*2;

    rotate_extrude(convexity: 2) {
      square(size: [ r, h ])

      translate(v: [ 0, h ])
      intersection() {
        square(size: [ r, r ]);
        scale(v: [ 1, 0.7 ]); circle(r: r)
      }

      translate(v: [ 0, h+r ])
      intersection() {
        translate(v: [ 0, -r/2 ]); square(size: [ r/2, r ])
        circle(r: r/2);
      }
    }
  end
  
  def assembled()
    translate(z: @total_height - @thickness)
    linear_extrude(height: @thickness, convexity: 4); shape_inner_disc()
    linear_extrude(height: @thickness, convexity: 4); shape_outer_disc()

    color(color: [ 0.7, 0.7, 1 ]) {
      [ 0, 120, 240 ].each do |alpha|
        rotate(a: alpha)
        translate(y: @thickness*2 + @locklen1 + @inner1_to_inner2 + @boltlen + @midhole)
        rotate(a: [ 90, 0, -90 ])
        linear_extrude(height: @thickness, convexity: 10, center: true); shape_tripod()
      end
    }
    background; translate(z: @thickness*2); bottle()
  end

  def render()
    parts() if (@mode == :parts)
    exploded() if (@mode == :exploded)
    assembled() if (@mode == :assembled)
  end
end

Example017.new(mode: :exploded).render()
