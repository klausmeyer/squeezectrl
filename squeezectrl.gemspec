# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'squeezectrl/version'

Gem::Specification.new do |spec|
  spec.name          = "squeezectrl"
  spec.version       = Squeezectrl::VERSION
  spec.authors       = ["Klaus Meyer"]
  spec.email         = ["spam@klaus-meyer.net"]

  spec.summary       = "CLI for mysqueezebox.com remote control feature"
  spec.description   = "Use remote control feature from mysqueezebox.com from your terminal"
  spec.homepage      = "https://github.com/klausmeyer/squeezectrl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "poltergeist", "~> 1.10"
  spec.add_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
