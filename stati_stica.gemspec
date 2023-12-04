# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stati_stica/version'

Gem::Specification.new do |spec|
  spec.name          = "stati_stica"
  spec.version       = StatiStica::VERSION
  spec.authors       = ["Sigfrid Dusci"]
  spec.email         = ["sig@inforlife.ch"]
  spec.summary       = "Statistical functions for Ruby"
  spec.homepage      = "https://github.com/sigfrid/stati_stica"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.4.22"
  spec.add_development_dependency "rake", "~> 13.0.6"
  spec.add_development_dependency "rspec", "~> 3.12.0"
end
