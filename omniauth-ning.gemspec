# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/ning/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-ning"
  spec.version       = Omniauth::Ning::VERSION
  spec.authors       = ["Don Pottinger"]
  spec.email         = ["don@bignerdranch.com"]
  spec.description   = %q{Omniauth Strategy for Ning API}
  spec.summary       = %q{Use this gem to implement an Omniauth client for Ning.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'omniauth-oauth', "~> 1.0.1"
  spec.add_development_dependency 'rspec', ">= 2.8.0"
  spec.add_development_dependency 'rdoc', ">= 3.12"
  spec.add_development_dependency 'bundler', ">= 1.0.0"
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
end