require 'test_helper'

class KeyTest < Minitest::Test

  def test_to_lilypond
    node = MusicXML::Node::ScorePartwise.new(fake_node)
    assert_kind_of Lilypond::Converter, node.to_lilypond
  end

  def test_to_vexflow
    node = MusicXML::Node::ScorePartwise.new(fake_node)
    assert_kind_of Vexflow::Converter, node.to_vexflow
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
