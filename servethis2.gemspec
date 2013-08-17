# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'servethis2/version'

Gem::Specification.new do |spec|
  spec.name          = "servethis2"
  spec.version       = Servethis2::VERSION
  spec.authors       = ["MOZGIII"]
  spec.email         = ["mike-n@narod.ru"]
  spec.description   = %q{This gem provides a command to run a web server inside a particulatr directory.}
  spec.summary       = %q{Explore a directory to the web with a single command!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rack"
  spec.add_dependency "rack-nocache"
end
