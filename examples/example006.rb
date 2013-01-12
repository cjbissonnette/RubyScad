load "../RubyScad.rb"

module Example006
  extend RubyScad

  def self.edgeprofile()
    render(convexity: 2)
    difference() {
      cube(size: [20, 20, 150], center: true)
      translate(v: [-10, -10, 0])
      cylinder(h: 80, r: 10, center: true)
      translate(v:[-10, -10, 40])
      sphere(r: 10);
      translate(v: [-10, -10, -40])
      sphere(r: 10)
    }
  end

  difference() {
    cube(size: 100, center: true)
    [[0, 0, 0], [1, 0, 0], [0, 1, 0]].each do |rot|
      rotate(a: 90, v: rot) {
        [[1, 1, 0], [-1, 1, 90], [-1, -1, 180], [1, -1, 270]].each do |p|
          translate(v: [ p[0]*50, p[1]*50, 0 ])
          rotate(a: p[2], v: [0, 0, 1])
          edgeprofile()
        end
      }
    end
    [
     [ 0, 0, [ [0, 0] ] ],
     [ 90, 0, [ [-20, -20], [20, 20] ] ],
     [ 180, 0, [ [-20, -25], [-20, 0], [-20, 25], [20, -25], [20, 0], [20, 25] ] ],
     [ 270, 0, [ [0, 0], [-25, -25], [25, -25], [-25, +25], [25, 25] ] ],
     [ 0, 90, [ [-25, -25], [0, 0], [25, 25] ] ],
     [ 0, -90, [ [-25, -25], [25, -25], [-25, 25], [25, 25] ] ]
    ].each do |i|
      rotate(a: i[0], v: [0, 0, 1])
      rotate(a: i[1], v: [1, 0, 0])
      translate(y: -50) {
        i[2].each { |j| translate(v: [j[0], 0, j[1]]); sphere(r: 10) }
      }
    end
  }
end

