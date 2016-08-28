require 'test_helper'

class KeyTest < Minitest::Test
  XML = <<-XML.freeze
<key>
  <fifths>0</fifths>
  <mode>major</mode>
</key>
XML

  def test_humanize
    return_value = Object.new
    mock = Minitest::Mock.new
    mock.expect(:humanize, return_value)

    MusicXML::KeySignature.stub(:new, mock) do
      node = MusicXML::Node::Key.new(Nokogiri::XML(XML))
      assert_equal return_value, node.humanize
    end
    mock.verify
  end
end
