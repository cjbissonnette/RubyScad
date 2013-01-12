load "../RubyScad.rb"

module Example007
  extend RubyScad

  def self.cutout()
    intersection() {
      rotate(a: 90, v: [1, 0, 0])
      translate(z: -50)
      linear_extrude(height: 100, convexity: 1)
      import(file:"example007.dxf", layer:"cutout1")
      rotate(a: 90, v: [0, 0, 1])
      rotate(a: 90, v: [1, 0, 0])
      translate(z: -50)
      linear_extrude(height: 100, convexity: 2)
      import(file: "example007.dxf", layer: "cutout2")
    }
  end

  def self.clip()
    difference() {
      rotate_extrude(convexity: 3)
      import(file: "example007.dxf", layer: "dorn")
      [0, 90].each { |r| rotate(z: r); cutout() }
    }
  end

  def self.cutview()
    difference() {
      difference() {
        translate(z: -10); clip()
        rotate(z: 20)
        rotate(y: -20)
        translate(x: 18)
        cube(size: 30, center: true)
      }

      render(convexity: 5)
      intersection() {
        translate(z: -10)
        clip	
        rotate(z: 20)
        rotate(y: -20)
        translate(x: 18)
        cube(size: 30, center: true)
      }
    }
  end

  translate(z: -10); clip()
  #cutview()
end


