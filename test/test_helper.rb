require 'simplecov'
SimpleCov.start do
  add_filter '/test'
end

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'musicxml'

require 'minitest/autorun'
require 'minitest/mock'
