# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'musicxml/version'

Gem::Specification.new do |spec|
  spec.name          = 'musicxml'
  spec.version       = MusicXML::VERSION
  spec.authors       = ['Kevin Deisz']
  spec.email         = ['kevin.deisz@gmail.com']

  spec.summary       = 'Ruby bindings for musicxml'
  spec.homepage      = 'https://github.com/kddeisz/musicxml'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '~> 1.6'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rubocop'
end
