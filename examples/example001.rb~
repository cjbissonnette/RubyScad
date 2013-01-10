load "../RubyScad.rb"

class Example001
  include RubyScad

  def initialize(args={})
    @size = args.fetch(:size, 50).to_f
    @hole = args.fetch(:hole, 25).to_f
  end

  def r_from_dia(d)
    d / 2.0
  end
  
  def rotcy(rot, r, h)
    rotate(a: 90, v: rot)
    cylinder(r: r, h: h, center: true)
  end

  def render
    cy_r = r_from_dia(@hole)
    cy_h = r_from_dia(@size * 2.5)

    difference() {
      sphere(r: r_from_dia(@size))
      rotcy([0, 0, 0], cy_r, cy_h)
      rotcy([1, 0, 0], cy_r, cy_h)
      rotcy([0, 1, 0], cy_r, cy_h)
    }    
  end
end

Example001.new(size: ARGV.fetch(0, 50), hole: ARGV.fetch(1, 25)).render if __FILE__ == $0
