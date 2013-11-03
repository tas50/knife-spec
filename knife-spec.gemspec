# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife-spec/version'

Gem::Specification.new do |spec|
  spec.name          = 'knife-spec'
  spec.version       = Knife::Spec::VERSION
  spec.authors       = ['Seth Vargo']
  spec.email         = ['sethvargo@gmail.com']
  spec.description   = 'Knife plugin for generating cookbook specs'
  spec.summary       = 'knife-spec is a knife plugin that automatically ' \
                       'generates Chef cookbook specs (tests) stubs.'
  spec.homepage      = 'https://github.com/sethvargo/knife-spec'
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'chef'

  # Development dependencies
  spec.add_development_dependency 'rake'

  # Testing dependencies
  spec.add_development_dependency 'aruba', '~> 0.5'
  spec.add_development_dependency 'oj',    '~> 2.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
