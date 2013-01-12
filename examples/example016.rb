load "../RubyScad.rb"

# example016.stl is derived from Mblock.stl
# (c) 2009 Will Langford licensed under
# the Creative Commons - GNU GPL license.
# http://www.thingiverse.com/thing:753

# Jonas Pfeil converted the file to binary
# STL and duplicated its content.

module Example0016
  extend RubyScad

  def self.blk1()
    cube(size: [ 65, 28, 28 ], center: true)
  end

  def self.blk2()
    difference() {
      translate(z: 7.5)
      cube(size: [ 60, 28, 14 ], center: true)
      cube(size: [ 8, 32, 32 ], center: true)
    }
  end

  def self.chop()
    translate(x: -14)
    import(file: "example016.stl", convexity: 12)
  end

  difference() {
    blk1()
    [0, 90, 180, 270].each do |alpha|
      rotate(a: alpha, v: [ 1, 0, 0])
      render(convexity: 12)
      difference() {
        blk2()
          chop()
      }
    end
  }
end

