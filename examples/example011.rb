require "rubyscad"

module Example011
  extend RubyScad

  polyhedron(
             points: [
                      [10, 0, 0],
                      [0, 10, 0],
                      [-10, 0, 0],
                      [0, -10, 0],
                      [0, 0, 10]
                     ],
             triangles: [
                         [0, 1, 2, 3],
                         [4, 1, 0],
                         [4, 2, 1],
                         [4, 3, 2],
                         [4, 0, 3]
                        ]
             )
end
