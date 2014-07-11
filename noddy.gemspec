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
  spec.description   = %q{Noddy Logger is a very simple library to quickly output logs from your scripts and applications using colours, timestamps etc.}
  spec.homepage      = "https://github.com/davent/noddy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
