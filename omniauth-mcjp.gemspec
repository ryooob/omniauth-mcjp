# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-mcjp/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-mcjp"
  spec.version       = Omniauth::Mcjp::VERSION
  spec.authors       = ["Ryo Oba"]
  spec.email         = ["ryo.oba.ggl@gmail.com"]
  spec.summary       = %q{OmniAuth strategy for minecraft.jp}
  spec.description   = %q{OmniAuth strategy for minecraft.jp}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth-oauth2', '~> 1.2.0'
end
