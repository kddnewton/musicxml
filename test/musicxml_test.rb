require 'test_helper'

class MusicXMLTest < Minitest::Test

  def test_compile_js
    pathname = Pathname('lib/assets/musicxml-min.js')
    FileUtils.rm(pathname) if File.file?(pathname)
    MusicXML.compile_js
    assert File.file?(pathname)
  end
end
