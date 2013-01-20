require "rubyscad"

module Example009
  extend RubyScad

  bodywidth = dxf_dim(file: "example009.dxf", name: "bodywidth")
  fanwidth = dxf_dim(file: "example009.dxf", name: "fanwidth")
  platewidth = dxf_dim(file: "example009.dxf", name: "platewidth")
  fan_side_center = dxf_cross(file: "example009.dxf", layer: "fan_side_center")
  fanrot = dxf_dim(file: "example009.dxf", name: "fanrot")

  background {
    linear_extrude(height: bodywidth, center: true, convexity: 10)
    import(file: "example009.dxf", layer: "body")
  }

  background {
    [+(bodywidth/2 + platewidth/2),
     -(bodywidth/2 + platewidth/2)].each do |z|
      translate(z: z)
      linear_extrude(height: platewidth, center: true, convexity: 10)
      import(file: "example009.dxf", layer: "plate")
    end
  }

  intersection() {
    linear_extrude(height: fanwidth, center: true, convexity: 10, twist: -fanrot)
    import(file: "example009.dxf", layer: "fan_top")

    rotate_extrude(file: "example009.dxf", layer: "fan_side", origin: fan_side_center, convexity: 10)
  }
end

