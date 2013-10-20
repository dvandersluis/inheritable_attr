# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inheritable_attr/version'

Gem::Specification.new do |spec|
  spec.name          = 'inheritable_attr'
  spec.version       = InheritableAttr::VERSION
  spec.authors       = ['Daniel Vandersluis']
  spec.email         = ['dvandersluis@selfmgmt.com']
  spec.description   = %q{Creates a class-level attribute that is inherited (but modifiable) by subclasses }
  spec.summary       = %q{Creates class-level inheritable attributes that can also be accessed through the instance}
  spec.homepage      = 'https://github.com/dvandersluis/inheritable_attr'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'activesupport', '>= 3.0.0'
end
