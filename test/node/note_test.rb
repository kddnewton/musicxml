require 'test_helper'

class NoteTest < Minitest::Test
  XML = <<-XML.freeze
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

  def test_accidental
    node = Nokogiri::XML(XML)
    note = MusicXML::Node::Note.new(node)
    assert_equal 'double-sharp', note.accidental
  end
end
