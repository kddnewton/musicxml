require 'test_helper'

class KeyTest < Minitest::Test

  def test_to_lilypond
    node = MusicXML::Node::ScorePartwise.new(fake_node)
    assert_equal %{\\version "2.14.1"}, node.to_lilypond
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
