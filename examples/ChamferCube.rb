load 'BasicCube.rb'

class ChamferCube < BasicCube

  def initialize(args={})
    super
    @chamfer = [].fill(0, 0..11)
  end

  def chamfer_edge(edge, value)
    @chamfer[edge] = value
  end

  def chamfer_edges(array)
    array.each { |v| chamfer_edge(v[0], v[1]) }
  end

  def chamfer_side(side, value)
    case side
    when 0
      chamfer_edge(0, value)
      chamfer_edge(1, value)
      chamfer_edge(2, value)
      chamfer_edge(3, value)
    when 1
      chamfer_edge(0, value)
      chamfer_edge(4, value)
      chamfer_edge(5, value)
      chamfer_edge(8, value)
    when 2
      chamfer_edge(5, value)
      chamfer_edge(1, value)
      chamfer_edge(6, value)
      chamfer_edge(9, value)
    when 3
      chamfer_edge(2, value)
      chamfer_edge(6, value)
      chamfer_edge(7, value)
      chamfer_edge(10, value)
    when 4
      chamfer_edge(3, value)
      chamfer_edge(4, value)
      chamfer_edge(11, value)
      chamfer_edge(7, value)
    when 5
      chamfer_edge(8, value)
      chamfer_edge(9, value)
      chamfer_edge(10, value)
      chamfer_edge(11, value)
    end
  end

  def chamfer_sides(array)
    array.each{ |v| chamfer_side(v[0], v[1]) }
  end

  def apply_chamfer(edge, value)
      case edge
      when 0
        translate(y: -y/2.0, z: z/2.0) { rotate(x:45) { chamfer_cube([x+PAD, value, value]) } }
      when 1
        translate(x: x/2.0, y: -y/2.0) { rotate(z:45) { chamfer_cube([value, value, z+PAD]) } }
      when 2
        translate(y: -y/2.0, z: -z/2.0) { rotate(x:45) { chamfer_cube([x+PAD, value, value]) } }
      when 3
        translate(x: -x/2.0, y: -y/2.0) { rotate(z:45) { chamfer_cube([value, value, z+PAD]) } }
      when 4
        translate(x: -x/2.0, z: z/2.0) { rotate(y:45) { chamfer_cube([value, y+PAD, value]) } }
      when 5
        translate(x: x/2.0, z: z/2.0) { rotate(y:45) { chamfer_cube([value, y+PAD, value]) } }
      when 6
        translate(x: x/2.0, z: -z/2.0) { rotate(y:45) { chamfer_cube([value, y+PAD, value]) } }
      when 7
        translate(x: -x/2.0, z: -z/2.0) { rotate(y:45) { chamfer_cube([value, y+PAD, value]) } }
      when 8
        translate(y: y/2.0, z: z/2.0) { rotate(x:45) { chamfer_cube([x+PAD, value, value]) } }
      when 9
        translate(x: x/2.0, y: y/2.0) { rotate(z:45) { chamfer_cube([value, value, z+PAD]) } }
      when 10
        translate(y: y/2.0, z: -z/2.0) { rotate(x:45) { chamfer_cube([x+PAD, value, value]) } }
      when 11
        translate(x: -x/2.0, y: y/2.0) { rotate(z:45) { chamfer_cube([value, value, z+PAD]) } }
      end
  end

  def chamfer_cube(size)
    cube(size: size, center: true)
  end

  def render(args={})
    difference {
      super
      @chamfer.each_with_index { |v, i| apply_chamfer(i, v) if v > 0 }
    }
  end
end
