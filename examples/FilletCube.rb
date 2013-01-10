load "ChamferCube.rb"

class FilletCube < ChamferCube
  
  attr_accessor :smooth

  def initialize(args={})
    super
    @smooth = 30
    @fillet = [].fill(0, 0..11)
  end

  def fillet_edge(edge, value)
    @fillet[edge] = value
  end
  
  def fillet_edges(array)
    array.each { |v| fillet_edge(v[0], v[1]) }
  end

  def fillet_side(side, value)
    case side
    when 0
      fillet_edge(0, value)
      fillet_edge(1, value)
      fillet_edge(2, value)
      fillet_edge(3, value)
    when 1
      fillet_edge(0, value)
      fillet_edge(4, value)
      fillet_edge(5, value)
      fillet_edge(8, value)
    when 2
      fillet_edge(5, value)
      fillet_edge(1, value)
      fillet_edge(6, value)
      fillet_edge(9, value)
    when 3
      fillet_edge(2, value)
      fillet_edge(6, value)
      fillet_edge(7, value)
      fillet_edge(10, value)
    when 4
      fillet_edge(3, value)
      fillet_edge(4, value)
      fillet_edge(11, value)
      fillet_edge(7, value)
    when 5
      fillet_edge(8, value)
      fillet_edge(9, value)
      fillet_edge(10, value)
      fillet_edge(11, value)
    end
  end

  def fillet_sides(array)
    array.each{ |v| fillet_side(v[0], v[1]) }
  end

  def apply_fillet(edge, value)
    case edge
    when 0
      translate(y: -y/2.0+value, z: z/2.0-value) {
        difference() {
          translate(y:-value-PAD, z: value+PAD) { 
            fillet_cube([x+2.0*PAD, value*2.0+PAD, value*2.0+PAD])
          }
          rotate(y: 90) { fillet_cylinder(x+4*PAD, value) }
        }
      }
    when 1
      translate(x: x/2.0-value, y: -y/2.0+value) {
        difference() {
          translate(x: value+PAD, y: -value-PAD) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, z+2.0*PAD])
          }
          fillet_cylinder(z+4*PAD,value)
        }
      }
    when 2
      translate(y: -y/2.0+value, z: -z/2.0+value) {
        difference() {
          translate(y: -value-PAD, z: -value-PAD) {
            fillet_cube([x+2.0*PAD, value*2.0+PAD, value*2.0+PAD])
          }
          rotate(y: 90) {  fillet_cylinder(x+4*PAD,value) }
        }
      }
    when 3
      translate(x: -x/2.0+value, y: -y/2.0+value) {
        difference() {
          translate(x: -value-PAD, y: -value-PAD) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, z+2.0*PAD])
          }
          fillet_cylinder(z+4*PAD,value)
        }
      }
    when 4
      translate(x: -x/2.0+value, z: z/2.0-value) {
        difference() {
          translate(x: -value-PAD, z: value+PAD) {
            fillet_cube([value*2.0+PAD, y+2.0*PAD, value*2.0+PAD])
          }
          rotate(y: 90, z: 90) { fillet_cylinder(y+4*PAD, value) }
        }
      }
    when 5
      translate(x: x/2.0-value, z: z/2.0-value) {
        difference() {
          translate(x: value+PAD, z: value+PAD) {
            fillet_cube([value*2.0+PAD, y+2.0*PAD, value*2.0+PAD])
          }
          rotate(y: 90, z: 90) { fillet_cylinder(y+4*PAD, value) }
        }
      }
    when 6
      translate(x: x/2.0-value, z: -z/2.0+value) {
        difference() {
          translate(x: value+PAD, z: -value-PAD) {
            fillet_cube([value*2.0+PAD, y+2.0*PAD, value*2.0+PAD])
          }
          rotate(y: 90, z: 90) {  fillet_cylinder(y+4*PAD, value) }
        }
      }
    when 7
      translate(x: -x/2.0+value, z: -z/2.0+value) {
        difference() {
          translate(x: -value-PAD, z: -value-PAD) {
            fillet_cube([value*2.0+PAD, y+2.0*PAD, value*2.0+PAD])
          }
          rotate(y: 90, z: 90) { fillet_cylinder(y+4*PAD, value) }
        }
      }
    when 8
      translate(y: y/2.0-value, z: z/2.0-value) {
        difference() {
          translate(y: value+PAD, z: value+PAD) {
            fillet_cube([x+2.0*PAD, value*2.0+PAD, value*2.0+PAD])
          }
          rotate(y: 90) { fillet_cylinder(x+4*PAD,value) }
        }
      }
    when 9
      translate(x: x/2.0-value, y: y/2.0-value) {
        difference() {
          translate(x: value+PAD, y: value+PAD) {
            fillet_cube([value*2+PAD, value*2+PAD, z+2*PAD])
          }
          fillet_cylinder(z+4*PAD, value)
        }
      }
    when 10
      translate(y: y/2.0-value, z: -z/2.0+value) {
        difference() {
          translate(y: value+PAD, z: -value-PAD) {
            fillet_cube([x+2.0*PAD, value*2.0+PAD, value*2.0+PAD])
          }
          rotate(y: 90) { fillet_cylinder(x+4*PAD,value) }
        }
      }
    when 11
      translate(x: -x/2.0+value, y: y/2.0-value) {
        difference() {
          translate(x: -value-PAD, y: value+PAD) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, z+2.0*PAD])
          }
          fillet_cylinder(z+4*PAD, value)
        }
      }
    end
  end

  def fillet_corner(corner, value)
    case corner
    when 0
      translate(v:[-x/2.0+value, -y/2.0+value, z/2.0-value]) {
        difference() {
          translate(v:[-value-PAD, -value-PAD, value+PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 1
      translate(v:[x/2.0-value, -y/2.0+value, z/2.0-value]) {
        difference() {
          translate(v:[value+PAD, -value-PAD, value+PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 2
      translate(v:[x/2.0-value, -y/2.0+value, -z/2.0+value]) {
        difference() {
          translate(v:[value+PAD, -value-PAD, -value-PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 3
      translate(v:[-x/2.0+value, -y/2.0+value, -z/2.0+value]) {
        difference() {
          translate(v:[-value-PAD, -value-PAD, -value-PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 4
      translate(v:[-x/2.0+value, y/2.0-value, z/2.0-value]) {
        difference() {
          translate(v:[-value-PAD, value+PAD, value+PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 5
      translate(v:[x/2.0-value, y/2.0-value, z/2.0-value]) {
        difference() {
          translate(v: [value+PAD, value+PAD, value+PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 6
      translate(v:[x/2.0-value, y/2.0-value, -z/2.0+value]) {
        difference() {
          translate(v:[value+PAD, value+PAD, -value-PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    when 7
      translate(v:[-x/2.0+value, y/2.0-value, -z/2.0+value]) {
        difference() {
          translate(v:[-value-PAD, value+PAD, -value-PAD]) {
            fillet_cube([value*2.0+PAD, value*2.0+PAD, value*2.0+PAD])
          }
          fillet_sphere(value)
        }
      }
    end
  end

  def fillet_sphere(r)
    sphere(r: r, fn: @smooth)
  end

  def fillet_cylinder(height, radius)
    cylinder(r: radius, h: height, center: true, fn: @smooth)
  end

  def fillet_cube(size)
    cube(size: size, center:true)
  end

  def greater_than_0(*args)
    args.each { |v| return nil if v <= 0 }
    return true
  end

  def auto_corner_fillet()
    if greater_than_0(@fillet[0], @fillet[3], @fillet[4])
      fillet = average(@fillet[0], @fillet[3], @fillet[4])
      fillet_corner(0, fillet)
    end
    if greater_than_0(@fillet[0], @fillet[1], @fillet[5])
      fillet = average(@fillet[0], @fillet[1], @fillet[5])
      fillet_corner(1, fillet)
    end
    if greater_than_0(@fillet[1], @fillet[2], @fillet[6])
      fillet = average(@fillet[1], @fillet[2], @fillet[6])
      fillet_corner(2, fillet)
    end
    if greater_than_0(@fillet[2], @fillet[3], @fillet[7])
      fillet = average(@fillet[2], @fillet[3], @fillet[7])
      fillet_corner(3, fillet)
    end
    if greater_than_0(@fillet[4], @fillet[8], @fillet[11])
      fillet = average(@fillet[4], @fillet[8], @fillet[11])
      fillet_corner(4, fillet)
    end
    if greater_than_0(@fillet[5], @fillet[8], @fillet[9])
      fillet = average(@fillet[5], @fillet[8], @fillet[9])
      fillet_corner(5, fillet)
    end
    if greater_than_0(@fillet[6], @fillet[9], @fillet[10])
      fillet = average(@fillet[6], @fillet[9], @fillet[10])
      fillet_corner(6, fillet)
    end
    if greater_than_0(@fillet[7], @fillet[10], @fillet[11])
      fillet = average(@fillet[7], @fillet[10], @fillet[11])
      fillet_corner(7, fillet)
    end    
  end
  
  def average(*args)
    args.inject(0.0) { |sum, el| sum + el } / args.size
  end

  def render(args={})
    difference {
      super
      @fillet.each_with_index { |v, i| apply_fillet(i, v) if v > 0 }
      auto_corner_fillet()
    }
  end
end

cube = FilletCube.new(size:[5, 7, 8], center: true)
cube.fillet_side(1, 1)
cube.fillet_side(0, 1)
cube.render
