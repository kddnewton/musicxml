require 'test_helper'

class NodeTest < Minitest::Test

  def test_register
    MusicXML::Node.register :test_node do
      def self.echo(string)
        string
      end
    end

    assert MusicXML::Node.const_defined?(:TestNode)
    assert_equal 'test', MusicXML::Node::TestNode.echo('test')
  end

  def test_registration
    constants = [:Attributes, :Clef, :Defaults, :Encoding, :Identification, :Measure, :Note, :Notations,
      :Part, :PartList, :Pitch, :ScoreInstrument, :ScorePart, :Key, :ScorePartwise]

    constants.each do |constant|
      assert MusicXML::Node.const_defined?(constant)

      clazz = MusicXML::Node.const_get(constant)
      assert clazz.respond_to?(:config)
    end
  end
end
