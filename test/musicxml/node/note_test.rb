require 'test_helper'

class NoteTest < Minitest::Test
  def test_accidental
    node = fake_node
    note = MusicXML::Node::Note.new(node)
    assert_equal "double-sharp", note.accidental
  end

  private
  def fake_node
    xml = <<-XML
    <note>
      <pitch>
        <step>C</step>
        <alter>2</alter>
        <octave>5</octave>
      </pitch>
      <duration>1</duration>
      <voice>1</voice>
      <type>quarter</type>
      <accidental>double-sharp</accidental>
    </note>
    XML

    Nokogiri::XML(xml)
  end
end
