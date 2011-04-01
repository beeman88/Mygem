# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mygem/version"

Gem::Specification.new do |s|
  s.name        = "mygem"
  s.version     = Mygem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bryan Belyk"]
  s.email       = ["bbbelyk@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{My first gem}
  s.description = %q{returns Hello World}

  s.add_development_dependency 'rspec'

  s.rubyforge_project = "mygem"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
