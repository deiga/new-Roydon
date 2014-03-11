$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mall/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mall"
  s.version     = Mall::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Mall."
  s.description = "TODO: Description of Mall."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.3"
end
