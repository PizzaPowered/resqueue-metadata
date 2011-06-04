# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resqueue-metadata/version"

Gem::Specification.new do |s|
  s.name        = "resqueue-metadata"
  s.version     = Resqueue::Metadata::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Caius Durling"]
  s.email       = ["dev@caius.name"]
  s.homepage    = "http://github.com/pizzapowered/resqueue-metadata"
  s.summary     = %q{Lets you store metadata against your resque queues}
  s.description = %q{Store a hash of any metadata against your queues in resque}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "resque"
  s.add_dependency "redis-objects"

  s.add_development_dependency "rspec"

end
