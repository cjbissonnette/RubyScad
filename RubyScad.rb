require 'matrix'

class Numeric
  def radians
    self * Math::PI / 180
  end
end

class Float
  FP_P = 3
  def to_s
    "%.#{FP_P}f" % self.round(FP_P)
  end
end

module RubyScad
  VERSION = "1.0"

  START_BLOCK = "{"
  END_BLOCK = "}"
  TAB_SIZE = 3
  PAD = 0.01

  CUBE_STR = "cube(%<args>s);"
  SPHERE_STR = "sphere(%<args>s);"
  CYLINDER_STR = "cylinder(%<args>s);"
  POLYHEDRON_STR = "polyhedron(%<args>s);"
  SQUARE_STR = "square(%<args>s);"
  CIRCLE_STR = "circle(%<args>s);"
  POLYGON_STR = "polygon(%<args>s);"
  TRANSLATE_STR = "translate(%<args>s)"
  ROTATE_STR = "rotate(%<args>s)"
  SCALE_STR = "scale(%<args>s)"
  MIRROR_STR = "mirror(%<args>s)"
  MULTMATRIX_STR = "multmatrix(%<args>s)"
  COLOR_STR = "color(%<args>s)"
  UNION_STR = "union(%<args>s)"
  DIFFERENCE_STR = "difference(%<args>s)"
  INTERSECTION_STR = "intersection(%<args>s)"
  RENDER_STR = "render(%<args>s)"
  MINKOWSKI_STR = "minkowski(%<args>s)"
  HULL_STR = "hull(%<args>s)"
  BACKGROUND_STR = '%'
  DEBUG_STR = '#'
  ROOT_STR = '!'
  DISABLE_STR = '*'
  IMPORT_STR = "import(%<args>s);"
  SURFACE_STR = "surface(%<args>s);"
  LINEAR_EXTRUDE_STR = "linear_extrude(%<args>s)"
  ROTATE_EXTRUDE_STR = "rotate_extrude(%<args>s)"
  PROJECTION_STR = "projection(%<args>s)"

  INCLUDE_STR = "include <%<file>s>"
  USE_STR = "use <%<file>s>"
  ECHO_STR = "echo(%<string>s);"
  FA_STR = "$fa = %<value>s;"
  FS_STR = "$fs = %<value>s;"
  FN_STR = "$fn = %<value>s;"

  def fa(value)
    format_output FA_STR % {value: value}
  end

  def fs(value)
    format_output FS_STR % {value: value}
  end

  def fn(value)
    format_output FN_STR % {value: value}
  end

  def include(file)
    format_output INCLUDE_STR % {file: file}
  end

  def use(file)
    format_output USE_STR % {file: file}
  end

  def echo(*args)
    format_output ECHO_STR % {string: args.join(', ')}
  end

  def projection(args={}, &block)
    format_command PROJECTION_STR, args, &block
  end
  
  def linear_extrude(args={}, &block)
    str_end = args.include?(:file) ? ";" : ""
    format_command LINEAR_EXTRUDE_STR.concat(str_end), args, &block
  end

  def rotate_extrude(args={}, &block)
    str_end = args.include?(:file) ? ";" : ""
    format_command ROTATE_EXTRUDE_STR.concat(str_end), args, &block
  end

  def import(args={})
    format_command IMPORT_STR, args
  end

  def difference(&block)
    format_command DIFFERENCE_STR, &block
  end

  def union(&block)
    format_command UNION_STR, &block
  end

  def intersection(&block)
    format_command INTERSECTION_STR, &block
  end

  def render(args={}, &block)
    format_command RENDER_STR, args, &block 
  end

  def minkowski(&block)
    format_command MINKOWSKI_STR, &block
  end

  def hull(&block)
    format_command HULL_STR, &block
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

  def cube(args={})
    format_command CUBE_STR, args
  end

  def sphere(args={})
    if args.include?(:d)
      args[:r] = args[:d]/2.0
      args.delete(:d)
    end
    format_command SPHERE_STR, args
  end

  def polyhedron(args={})
    format_command POLYHEDRON_STR, args
  end

  def square(args={})
    format_command SQUARE_STR, args
  end

  def circle(args={})
    if args.include?(:d)
      args[:r] = args[:d]/2.0
      args.delete(:d)
    end
    format_command CIRCLE_STR, args
  end

  def polygon(args={})
    format_command POLYGON_STR, args
  end

  def surface(args={})
    format_command SURFACE_STR, args
  end

  def cylinder(args={})
    format_command CYLINDER_STR, args
  end

  def rotate(args={}, &block)
    vector_input(args, :a)
    format_command ROTATE_STR, args, &block
  end

  def translate(args={}, &block)
    vector_input(args, :v)
    format_command TRANSLATE_STR, args, &block
  end

  def scale(args={}, &block)
    vector_input(args, :v)
    format_command SCALE_STR, args, &block
  end

  def mirror(args={}, &block)
    vector_input(args, :v)
    format_command MIRROR_STR, args, &block
  end

  def multmatrix(args={}, &block)
    format_command MULTMATRIX_STR, args, &block
  end

  def color(args={}, &block)
    args[:color] = [args.fetch(:r, 0), args.fetch(:g, 0), args.fetch(:b, 0), args.fetch(:a, 1)] unless args.include?(:color)
    delete_from(args, :r, :g, :b, :a)
    format_command COLOR_STR, args, &block
  end

  def format_command(cmd_str, args={}, &block)
    arg_str = args.collect { |k, v| "#{format_key(k)} = #{format_value(v)}" }.join(', ')
    format_block cmd_str % {args: arg_str}, &block
  end
  
  def format_key(key)
    key = key.to_s
    key.prepend('$') if key.match("^f[asn]$")
    key
  end

  def format_value(var)
    if var.is_a?(Vector) or var.is_a?(Matrix)
      return var.to_a.to_s
    elsif var.is_a? String
      return '"' + var + '"'
    else
      return var.to_s
    end
  end

  def delete_from(hash, *keys)
    keys.each { |k| hash.delete(k) }
  end

  def vector_input(args, element)
    unless args.include?(element)
      args[element] = [args.fetch(:x, 0), args.fetch(:y, 0)]
      args[element].push(args[:z]) if args.include?(:z)
      delete_from(args, :x, :y, :z)
    end
  end

  def format_block(output_str)
    format_output output_str.concat(' ')
    if block_given?
      start_block
      yield
      end_block
    else
      new_line unless output_str.include?(';')
    end
  end

  def new_line
    format_output "\n"
  end

  def start_block()
    format_output START_BLOCK
  end

  def end_block()
    format_output END_BLOCK
  end

  def end_all_blocks()
    end_block while @@tab_level > 0
  end

  def space_string(str, tab_level)
    ((' '*TAB_SIZE)*tab_level) + str
  end

  def raw_output(str)
    if @@output_file
      File.open(@@output_file, 'a') { |f| f.print(str) } 
    else
      print str
    end
  end

  def format_output(str)
    @@prev_output ||= ""
    @@tab_level ||= 0
    str.lines do |l|
      l.concat("\n") if l.match('[;\}\{>]')
      @@tab_level-=1 if(l.include?('}')) && @@tab_level > 0
      l = space_string(l, @@tab_level) if @@prev_output.include?("\n") 
      raw_output(l)
      @@tab_level+=1 if(l.include?('{'))
      @@prev_output = l
    end
  end

  def self.start_output
    @@output_file = nil
    if ARGV[0] && ARGV[0].include?(".scad")
      @@output_file = ARGV[0]
      ARGV.shift
    end
    if @@output_file
      File.open(@@output_file, 'w') do |f|
        f.puts "//created with rubyscad #{VERSION}\n\n"
      end
    end
  end

  def self.extended(mod)
    start_output
    mod.class_variable_set(:@@fa, 30)
  end

  def self.included(mod)
    start_output
  end

  start_output if __FILE__== $0  

  def lookup(x, points)
    xmin, xmax = [0.0, 0.0]
    points.keys.sort.reverse_each do |k|
      if k <= x
        xmin = k
        break
      end
    end
    points.keys.sort.each do |k|
      if k >= x
        xmax = k
        break
      end
    end
    return points[xmax] if x == xmax
    return points[xmin] if x == xmin
    return points[xmin] + (((x - xmin) * (points[xmax] - points[xmin])) / (xmax - xmin))
  end

  def dxf_cross(args={})
    return 0.0
  end

  def dxf_dim(args={})
    return 0.0
  end
end
