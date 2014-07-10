# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noddy/version'

Gem::Specification.new do |spec|
  spec.name          = "noddy"
  spec.version       = Noddy::VERSION
  spec.authors       = ["Dave Avent"]
  spec.email         = ["davent@lumux.co.uk"]
  spec.summary       = %q{Noddy Logger logging library.}
  spec.description   = %q{Handles logging to stdout, stderr and file as well as log levels, timestamping and compression.}
  spec.homepage      = "https://github.com/davent/noddy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
