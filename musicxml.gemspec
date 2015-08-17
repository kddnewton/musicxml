$:.push File.expand_path('../lib', __FILE__)

require 'musicxml/version'

Gem::Specification.new do |s|
  s.name        = 'musicxml'
  s.version     = MusicXML::VERSION
  s.authors     = ['Kevin Deisz']
  s.email       = ['kevin.deisz@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Musicxml.'
  s.description = 'TODO: Description of Musicxml.'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'nokogiri'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'simplecov'
end
