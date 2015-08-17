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
end
