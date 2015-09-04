require 'test_helper'

class KeySignatureTest < Minitest::Test

  def test_initialize
    number = Object.new
    key_signature = MusicXML::KeySignature.new(number)
    assert_equal number, key_signature.number
  end

  def test_humanize
    key_signature = MusicXML::KeySignature.new(0)
    assert_equal 'C', key_signature.humanize

    key_signature = MusicXML::KeySignature.new(2)
    assert_equal 'D', key_signature.humanize
  end

  def test_to_lilypond
    key_signature = MusicXML::KeySignature.new(0)
    assert_equal "\\key c \\major", key_signature.to_lilypond

    key_signature = MusicXML::KeySignature.new(6)
    assert_equal "\\key fis \\major", key_signature.to_lilypond

    key_signature = MusicXML::KeySignature.new(-2)
    assert_equal "\\key bes \\major", key_signature.to_lilypond
  end
end
