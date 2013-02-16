# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "rubyscad/version"

Gem::Specification.new do |gem|
  gem.name        = "rubyscad"
  gem.version     = RubyScad::VERSION
  gem.authors     = ["Curtis Bissonnette"]
  gem.email       = ["cjbissonnette@gmail.com"]
  gem.homepage    = "http://github.com/cjbissonnette/RubyScad"
  gem.summary     = %q{Easily use ruby to generate openscad scripts}
  gem.description = %q{Use the full power of ruby to write openscad scripts.}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
