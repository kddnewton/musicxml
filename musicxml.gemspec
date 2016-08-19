$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'musicxml/version'

Gem::Specification.new do |s|
  s.name        = 'musicxml'
  s.version     = MusicXML::VERSION
  s.authors     = ['Kevin Deisz']
  s.email       = ['kevin.deisz@gmail.com']
  s.homepage    = 'https://github.com/kddeisz/musicxml'
  s.summary     = 'Ruby bindings for musicxml'
  s.description = 'Read and parse musicxml in ruby'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']
  s.executables << 'lilypond'

  s.add_dependency 'nokogiri'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sinatra'
  s.add_development_dependency 'sprockets'
  s.add_development_dependency 'uglifier'
  s.add_development_dependency 'rubocop'
end
