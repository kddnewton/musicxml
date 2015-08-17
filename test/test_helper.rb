require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'musicxml'

require 'minitest/autorun'
require 'minitest/mock'
