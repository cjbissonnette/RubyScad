require 'rubyscad'

class BasicCube
  include RubyScad

  attr_accessor :size, :center

  def initialize(args={})
    @size = args.fetch(:size, [1,1,1])
    @center = args.fetch(:center, true)
  end

  def x()
    @size[0]
  end

  def x=(value)
    @size[0] = value
  end

  def y()
    @size[1]
  end

  def y=(value)
    @size[1] = value
  end

  def z()
    @size[2]
  end

  def z=(value)
    @size[2] = value
  end

  def translate_centered(&block)
    unless @center
      translate(v:[x/2.0, y/2.0, z/2.0], &block)
    else
      yield
    end
  end

  def render(args={})
    translate_centered {
      cube(size:@size, center: true)
    }
  end
end
