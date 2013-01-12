load "../RubyScad.rb"

module Example014
  extend RubyScad
  
  intersection() {
    [[0, 0, 0],
     [10, 20, 300],
     [200, 40, 57],
     [20, 88, 57]
    ].each { |i| rotate(a: i); cube(size: [100, 20, 20], center: true) }
  }
end

