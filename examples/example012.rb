require "rubyscad"

module Example012
  extend RubyScad

  # example012.stl is Mblock.stl, (c) 2009 Will Langford
  # licensed under the Creative Commons - GNU GPL license.
  # http://www.thingiverse.com/thing:753

  difference() {
    sphere(r: 20)
    translate(v: [-2.92, 0.5, 20])
    rotate(a: [180, 0, 180])
    import(file: "example012.stl", convexity: 5);
  }
end
