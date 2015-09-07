$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'musicxml'

$LOAD_PATH.unshift File.expand_path('..', __FILE__)
require 'server'

MusicXML.compile_js
run Sinatra::Application
