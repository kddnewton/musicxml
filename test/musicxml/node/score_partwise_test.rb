require 'test_helper'

class KeyTest < Minitest::Test

  def test_to_lilypond
    return_value = Object.new
    mock = Minitest::Mock.new
    mock.expect(:convert, return_value)

    node = MusicXML::Node::ScorePartwise.new(fake_node)
    Lilypond::Converter.stub :new, mock do
      assert_equal return_value, node.to_lilypond
    end
    mock.verify
  end

  private

    def fake_node
      xml = <<-XML
<score-partwise>
  <movement-title>Test Score</movement-title>
</score-partwise>
XML
      Nokogiri::XML(xml)
    end
end
