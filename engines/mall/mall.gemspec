$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mall/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mall"
  s.version     = Mall::VERSION.dup
  s.authors     = ["Timo Sand"]
  s.email       = ["timo.j.sand@gmail.com"]
  s.homepage    = "https://github.com/deiga/mall"
  s.summary     = "A webshop engine for rails"
  s.description = "A webshop engine for rails apps"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_dependency "money-rails"

  s.add_development_dependency "haml-rails"
end
