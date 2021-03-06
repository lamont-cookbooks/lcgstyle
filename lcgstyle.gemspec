# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lcgstyle/version"

Gem::Specification.new do |spec|
  spec.name          = "lcgstyle"
  spec.version       = Lcgstyle::VERSION
  spec.authors       = ["Thom May"]
  spec.email         = ["thom@chef.io"]

  spec.summary       = "Rubocop configuration for Chef's ruby projects"
  spec.homepage      = "https://github.com/chef/lcgstyle"
  spec.license       = "Apache-2.0"
  spec.required_ruby_version = ">= 2.0.0"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables = %w{lcgstyle}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency("rubocop", Lcgstyle::RUBOCOP_VERSION)
end
