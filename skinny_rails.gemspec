$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "skinny_rails"
  s.version     = "0.0.1"
  s.platform    = "ruby"
  s.authors     = ["Adam Jacox"]
  s.email       = ["yellowjacox@gmail.com"]
  s.license     = "MIT"
  s.homepage    = "https://github.com/yellowaj/skinny_rails"
  s.summary     = %q{Put your Rails app on a diet.}
  s.description = %q{Remove unnecessary Rails dependencies for simple "static" sites.}
  s.files = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
  s.add_development_dependency 'rails', '~> 4.0.0'
end