$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rubyscad/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rubyscad"
  s.version     = RubyScad::VERSION
  s.authors     = ["Curtis Bissonnette"]
  s.email       = ["cjbissonnette"]
  s.homepage    = "http://github.com/cjbissonnette"
  s.summary     = "Ruby module to easily generate openscad scripts"
  s.description = "Ruby module to easily generate openscad scripts"

  s.files = Dir["{lib}/**/*"] + ["README.md"]
end
