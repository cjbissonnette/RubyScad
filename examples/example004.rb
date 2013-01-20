require "rubyscad"

module Example004
  extend RubyScad

  difference() {
    cube(size: 30, center: true)
    sphere(r: 20)
  }
end

