# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "tic_tac_toe"
  spec.version       = "0.0.1"
  spec.authors       = ["Jake Nations"]
  spec.email         = ["jnations1214@gmail.com"]
  spec.description   = "tic tac toe in ruby"
  spec.summary       = "tic tac toe against an unbeatable AI"
  spec.homepage      = "www.jakenations.me"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['play']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
