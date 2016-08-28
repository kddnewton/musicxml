require 'test_helper'

class KeyTest < Minitest::Test

  def test_humanize
    return_value = Object.new
    mock = Minitest::Mock.new
    mock.expect(:humanize, return_value)

    MusicXML::KeySignature.stub(:new, mock) do
      node = MusicXML::Node::Key.new(fake_node)
      assert_equal return_value, node.humanize
    end
    mock.verify
  end

  private

  def fake_node
    xml = <<-XML
<key>
  <fifths>0</fifths>
  <mode>major</mode>
</key>
XML
    Nokogiri::XML(xml)
  end
end
