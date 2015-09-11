require 'test_helper'

class ParserTest < Minitest::Test

  def test_initialize
    filepath = 'samples/ActorPreludeSample.xml'
    assert MusicXML::Parser.new(filepath)

    filepath = 'bad_filepath'
    assert_raises ArgumentError do
      MusicXML::Parser.new(filepath)
    end
  end

  def test_parse
    parsed = nil
    fake_file do |file|
      parsed = MusicXML::Parser.new(file.path).parse
    end
    assert_kind_of MusicXML::Node::ScorePartwise, parsed
  end

  private

    def fake_file
      fake_doc = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 3.0 Partwise//EN" "http://www.musicxml.org/dtds/partwise.dtd">
<score-partwise version="3.0">
  <movement-title>Prelude to a Tragedy</movement-title>
</score-partwise>
XML

      file = Tempfile.new(['fake-', '.xml'])
      file.write(fake_doc)
      file.rewind

      begin
        yield file
      ensure
        file.close
        file.unlink
      end
    end
end
