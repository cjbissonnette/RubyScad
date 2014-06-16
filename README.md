RubyScad
========

Ruby module to easily generate openscad scripts

General Usage
-------------

Requirements: Ruby 1.9.3
Installation: `gem install rubyscad`

RubyScad is a ruby mixin module which provides functions which allow easy output of openscad scripts .  To use simply "include" or "extend" the module into any class or module:

    require "rubyscad"

    module Test

      extend RubyScad

      def self.cone(base=5, height=10)

        cylinder(r1: base, r2: 0, h:height)

      end

      cone(2, 4)
    end

---

  from command line: 

  print to standard output: `ruby test.rb`

  generate file: `ruby test.rb "test.scad"`

---

    require "rubyscad"

    class Test2

      include RubyScad

      def initialize(args={})
        @radius = args.fetch(:radius, 3)
      end

      def render()
        sphere(r:@radius)
      end
    end

    Test2.new.render

---

  print to standard output: `ruby test2.rb`

  generate file: `ruby test2.rb "test2.scad"`

General Considerations
-----------------------

- All arguments are passed as named hash values matching the openscad spec, exceptions are for functions fa, fs, fn, echo, include, and use (see below).  
  openscad: `cube(6)`  
  rubyscad: `cube(size: 6)`  
- It is however possible to use ruby arrays (or vectors and even matrices) as an argument instead of a hash as a shortcut.  
  The following 4 snippets produce identical output.  
  openscad:  `cube(size = [6,6,12]);`  
  rubyscad:  `cube(size: [6,6,12])`  
  openscad:  `cube([6,6,12]);`  
  rubyscad:  `cube([6,6,12])`  
  Please notice though that Rubyscad doesn't check if the code with an array as argument is valid openscad code, eg. `cylinder([10,10,5])` becomes `cylinder([10, 10, 5]);`, which is nonsense openscad code.  
- Any hash values may be passed to functions (with the exception of the ones noted above) but openscad may or may not use these values  
  *cube(openscadwontusethis: 5)* will produce *cube(openscadwontusethis = 5);*
  nothing bad will happen here, the value will just have no effect
- $fn, $fs, $fa variables are passed without the '$'  
  openscad: `sphere(4, $fn=12)`  
  rubyscad: `sphere(r: 4, fn: 12)`
- Ruby's math functions use radians, openscad uses degrees, for ease I've added a 'radians' function to the numeric class so the following is possible:  
  openscad: sin(15)  
  rubyscad: Math.sin(15.radians)
- All functions which take code blocks (union, difference, intersection, ...) can use the form "function() { code }" or "function()" with the following result:  
  the code:  
  
        translate(x: 5)
        cube(size: 7)

  would produce:

        translate([5,0,0])
        cube(size = 7);

  the code:

        translate(x: 5) {
          cube(size: 7)
        }

  would produce:

        translate([5,0,0]) {
          cube(size = 7);
        }

Openscad Functions:      
-------------------

  openscad: `$fa = 0.2;`  
  rubyscad: `fa 0.2`

----------------------------------------------------------------------------

  openscad: `$fs = 2;`  
  rubyscad: `fs 2`

----------------------------------------------------------------------------

  openscad: `$fn = 5;`  
  rubyscad: `fn 5`

----------------------------------------------------------------------------

  openscad: `include <file.scad>`  
  rubyscad: `include_scad "file.scad"`

----------------------------------------------------------------------------

  openscad: `use <file.scad>`  
  rubyscad: `use "file.scad"`

----------------------------------------------------------------------------

  openscad: `echo(1,2,3);`  
  rubyscad: `echo 1, 2, 3`

----------------------------------------------------------------------------

  openscad: `%`  
  rubyscad: `background`

----------------------------------------------------------------------------

  openscad: `#`  
  rubyscad: `debug`

----------------------------------------------------------------------------

  openscad: `!`  
  rubyscad: `root`

----------------------------------------------------------------------------

  openscad: `*`  
  rubyscad: `disable`

----------------------------------------------------------------------------

  openscad: `projection([args]) [{ code }]`  
  rubyscad: `projection([args]) [{ code }]`

----------------------------------------------------------------------------

  openscad: `linear_extrude([args]) [{ code }]`  
  rubyscad: `linear_extrude([args]) [{ code }]`

----------------------------------------------------------------------------

  openscad: `rotate_extrude([args]) [{ code }]`  
  rubyscad: `rotate_extrude([args]) [{ code }]`

----------------------------------------------------------------------------

  openscad: `import([args])`  
  rubyscad: `import([args])`

----------------------------------------------------------------------------

  openscad: `difference() { code }`  
  rubyscad: `difference() { code }`

----------------------------------------------------------------------------

  openscad: `union() { code }`  
  rubyscad: `union() { code }`

----------------------------------------------------------------------------

  openscad: `intersection() { code }`  
  rubyscad: `intersection() { code }`

----------------------------------------------------------------------------

  openscad: `render([args]) [{ code }]`  
  rubyscad: `render([args]) [{ code }]`

----------------------------------------------------------------------------

  openscad: `minkowski() { code }`  
  rubyscad: `minkowski() { code }`

----------------------------------------------------------------------------

  openscad: `hull() { code }`  
  rubyscad: `hull() { code }`

----------------------------------------------------------------------------

  openscad: `cube([args])`  
  rubyscad: `cube([args])`

----------------------------------------------------------------------------

  openscad: `sphere([args])`  
  rubyscad: `sphere([args])`  

* In addition to the normal arguments d: can also be provided instead of r: to specify the diameter instead of the radius

----------------------------------------------------------------------------

  openscad: `polyhedron([args])`  
  rubyscad: `polyhedron([args])`

----------------------------------------------------------------------------

  openscad: `square([args])`  
  rubyscad: `square([args])`

----------------------------------------------------------------------------

  openscad: `circle([args])`  
  rubyscad: `circle([args])`

* In addition to the normal arguments d: can also be provided instead of r: to specify the diameter instead of the radius

----------------------------------------------------------------------------

  openscad: `polygon([args])`  
  rubyscad: `polygon([args])`

----------------------------------------------------------------------------

  openscad: `surface([args])`  
  rubyscad: `surface([args])`

----------------------------------------------------------------------------

  openscad: `cylinder([args])`  
  rubyscad: `cylinder([args])`

----------------------------------------------------------------------------

  openscad: `rotate([args]) [{ code }]`  
  rubyscad: `rotate([args]) [{ code }]`

* In addition to specifying a: as a vector x:, y:, and z: can be used instead

----------------------------------------------------------------------------

  openscad: `translate([args]) [{ code }]`  
  rubyscad: `translate([args]) [{ code }]`

* In addition to specifying v: as a vector x:, y:, and z: can be used instead

----------------------------------------------------------------------------

  openscad: `scale([args]) [{ code }]`  
  rubyscad: `scale([args]) [{ code }]`

* In addition to specifying v: as a vector x:, y:, and z: can be used instead

----------------------------------------------------------------------------

  openscad: `mirror([args]) [{ code }]`  
  rubyscad: `mirror([args]) [{ code }]`

* In addition to specifying v: as a vector x:, y:, and z: can be used instead

----------------------------------------------------------------------------

  openscad: `multmatrix([args]) [{ code }]`  
  rubyscad: `multmatrix([args]) [{ code }]`

----------------------------------------------------------------------------

  openscad: `color([args]) [{ code }]`  
  rubyscad: `color([args]) [{ code }]`

* Instead of color: being defined, r:, g:, b:, and a: can be provided

RubyScad Functions:
-------------------

`format_command(cmd_str, args={}, &block)`

* an easy way to implement new openscad commands.
* cmd\_str should be in the form "func\_name(%&lt;args&gt;);"
* all arguments passed from "args" will be inserted into the <args> string modifier
* if a block is passed it will output between { }

----------------------------------------------------------------------------

`new_line`

* outputs a new line

----------------------------------------------------------------------------

`start_block`

* outputs a '{' at the correct tab level

----------------------------------------------------------------------------

`end_block`

* outputs a '}' at the correct tab level

----------------------------------------------------------------------------

`end_all_blocks`

* outputs a '}' for every open block

----------------------------------------------------------------------------

`format_output`

* outputs a string at the correct tab level
