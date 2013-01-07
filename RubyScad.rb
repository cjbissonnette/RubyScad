module RubyScad
  CUBE_STR = "cube(size=[%<x>.2f, %<y>.2f, %<z>.2f], center=%<center>s);"
  SPHERE_STR = "sphere(r=%<r>.2f, $fa=%<fa>.2f, $fs=%<fs>.2f, $fn=%<fn>.2f, center=%<center>s);"
  CYLINDER_STR = "cylinder(h=%<h>.2f, r1=%<r1>.2f, r2=%<r2>.2f, $fa=%<fa>.2f, $fs=%<fs>.2f, center=%<center>s);"
  POLYHEDRON_STR = "polyhedron(points=%<points>s, triangles=%<triangles>s, convexity=%<convexity>d, center=%<center>s);" 
  TRANSLATE_STR = "translate([%<x>.2f, %<y>.2f, %<z>.2f])"
  ROTATE_STR = "rotate([%<x>.2f, %<y>.2f, %<z>.2f])"
  SCALE_STR = "scale([%<x>.2f, %<y>.2f, %<z>.2f])"
  MIRROR_STR = "mirror([%<x>.2f, %<y>.2f, %<z>.2f])"
  MULTMATRIX_STR = "multmatrix(m=%<matrix>s)"
  COLOR_STR = "color([%<r>.1f, %<g>.1f, %<b>.1f, %<a>.1f])"
  COLOR_NAME_STR = "color(\"%<color>\")"
  UNION_STR = "union()"
  DIFFERENCE_STR = "difference()"
  INTERSECTION_STR = "intersection()"
  RENDER_STR = "render(convexity=%<convexity>%d)"
  MINKOWSKI_STR = "minkowski()"
  HULL_STR = "hull()"
  BACKGROUND_STR = '%'
  DEBUG_STR = '#'
  ROOT_STR = '!'
  DISABLE_STR = '*'
  IMPORT_STR = "import(\"%<file>s\");"
  INCLUDE_STR = "include <%<file>s>"
  USE_STR = "use <%<file>s>"
  ECHO_STR = "echo(\"%<string>s\");"
  SURFACE_STR = "surface(file=\"%<file>s\", center=%<center>s, convexity=%<convexity>d);"
  START_BLOCK = "{"
  END_BLOCK = "}"
  
  TAB_SIZE = 3
  @@tab_level = 0
  @@output_file = "default.scad"
  
  def echo(s, args={})
    format_output ECHO_STR % {string: s}
  end

  def import(file, args={})
    format_output IMPORT_STR % {file: file}
  end

  def include(file, args={})
    format_output INCLUDE_STR % {file: file}
  end

  def use(file, args={})
    format_output USE_STR % {file: file}
  end

  def difference(&block)
    format_block DIFFERENCE_STR, &block
  end

  def union(&block)
    format_block UNION_STR, &block
  end

  def intersection(&block)
    format_block INTERSECTION_STR, &block
  end

  def render(convexity=1, args={}, &block)
    format_block RENDER_STR % {convexity: convexity}, &block 
  end

  def minkowski(&block)
    format_block MINKOWSKI_STR, &block
  end

  def hull(&block)
    format_block HULL_STR, &block
  end

  def background()
    format_output BACKGROUND_STR
    yield if block_given?
  end

  def debug()
    format_output DEBUG_STR
    yield if block_given?
  end

  def root()
    format_output ROOT_STR
    yield if block_given?
  end

  def disable()
    format_output DISABLE_STR
    yield if block_given?
  end

  def cube(args={}, &block)
    x, y, z = vector_input(args.fetch(:size, [1,1,1]))
    center = args.fetch(:center, false)
    format_output CUBE_STR % {x: x, y: y, z: z, center: center}, &block
  end

  def sphere(args={}, &block)
    if args.include?(:d)
      r = args[:d]/2.0
    else
      r = args.fetch(:r, 0.0)
    end
    fa = args.fetch(:fa, 12)
    fs = args.fetch(:fs, 2)
    fn = args.fetch(:fn, 0)
    center = args.fetch(:center, false)
    format_output SPHERE_STR % {r: r, fa: fa, fs: fs, fn: fn, center: center}, &block
  end

  def polyhedron(args={}, &block)
    triangles = args.fetch(:triangles, [])
    points = args.fetch(:points, [])
    convexity = args.fetch(:convexity, 0)
    center = args.fetch(:center, false)
    format_output POLYHEDRON_STR % {points: points, triangles: triangles, convexity: convexity, center: center}, &block
  end

  def surface(args={}, &block)
    file = args.fetch(:file, [])
    convexity = args.fetch(:convexity, 0)
    center = args.fetch(:center, false)
    format_output SURFACE_STR % {file: file, convexity: convexity, center: center}, &block
  end

  def cylinder(args={}, &block)
    if args.include?(:r)
      r1 = r
      r2 = r
    else
      r1 = args.fetch(:r1, 0.0)
      r2 = args.fetch(:r2, 0.0)
    end
    h = args.fetch(:h, 0.0)
    fa = args.fetch(:fa, 12)
    fs = args.fetch(:fs, 2)
    center = args.fetch(:center, false)
    format_output CYLINDER_STR % {r1: r1, r2: r2, h: h, fa: fa, fs: fs, center: center }, &block
  end

  def translate(args={}, &block)
    vector_output TRANSLATE_STR, args, &block
  end

  def rotate(args={}, &block)
    vector_output ROTATE_STR, args, &block
  end

  def scale(args={}, &block)
    vector_output SCALE_STR, args, &block
  end

  def mirror(args={}, &block)
    vector_output MIRROR_STR, args, &block
  end

  def multmatrix(args={}, &block)
    m = args.fetch(:m, [])
    format_block MULTMATRIX_STR % {matrix: m}, &block
  end

  def color(args={}, &block)
    color = args.fetch(:color, nil)
    if color.is_a? String
      format_block COLOR_NAME_STR % {color:args}
    elsif color.is_a? Array
      r, g, b, a = color
      format_block COLOR_STR % {r: r, g: g, b: b, a: a}, &block
    end
  end
  
  def vector_output(string, args={}, &block)
    x, y, z = vector_input(args)
    format_block string % {x: x, y: y, z: z}, &block
  end

  def vector_input(args={})
    if args.is_a? Array
      x, y, z = args
    elsif args.is_a? Numeric
      x, y, z = [args,args,args]
    elsif args.is_a? Hash
      if args.include?(:v)
        x, y, z = args[:v]
      else
        x = args.fetch(:x, 0)
        y = args.fetch(:y, 0)
        z = args.fetch(:z, 0)
      end
    end
    return x, y, z
  end

  def format_block(output_str)
    format_output "#{output_str} #{START_BLOCK}"
    yield if  block_given?
    format_output "#{END_BLOCK}"
  end

  def space_string(str, tab_level)
    ((' '*TAB_SIZE)*tab_level) + str
  end

  def raw_output(str)
    print str
    File.open(@@output_file, 'a') { |f| f.print(str) }
  end

  def format_output(str)
    @@prev_output ||= ""
    str.lines do |l|
      l.concat("\n") if l.match('[;\}\{]')
      @@tab_level-=1 if(l.include?('}')) && @@tab_level > 0
      l = space_string(l, @@tab_level) if @@prev_output.include?("\n") 
      raw_output(l)
      @@tab_level+=1 if(l.include?('{'))
      @@prev_output = l
    end
  end

  def self.start_output(mod)
    @@tab_level = 0
    @@output_file = mod.name.concat ".scad"
    File.open(@@output_file, 'w') { |f| f.puts("//file auto generated with rubyscad\n\n") }    
  end

  def self.extended(mod)
    start_output(mod)
  end

  def self.included(mod)
    start_output(mod)
  end
end
