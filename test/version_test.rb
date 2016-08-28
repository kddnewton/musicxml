require 'test_helper'

class VersionTest < Minitest::Test
  def test_version_exists
    refute_nil ::MusicXML::VERSION
  end
end
