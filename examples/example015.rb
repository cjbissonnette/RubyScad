require "rubyscad"

module Example015
  extend RubyScad

  def self.shape()
    difference() {
      translate(v: [ -35, -35 ])
      intersection() {
        union() {
          difference() {
            square(size: 100, center: true);
            square(size: 50, center: true);
          }
          translate(v: [ 50, 50 ])
          square(size: 15, center: true);
        }
        rotate(a: 45); translate(v: [ 0, -15 ]); square(size: [ 100, 30 ])
      }
      rotate(a: -45); scale(v: [ 0.7, 1.3 ]); circle(r: 5)
    }
    import(file: "example009.dxf",
           layer: "body",
           convexity: 6,
           scale: 2)
  end

  #linear_extrude(convexity: 10, center: true)
  shape();
end



