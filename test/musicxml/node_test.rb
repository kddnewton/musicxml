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
    constants = [:Base, :Attributes, :Clef, :Defaults, :Encoding, :Identification, :Measure, :Note, :Notations,
      :Part, :PartList, :Pitch, :ScoreInstrument, :ScorePart, :Key, :ScorePartwise]

    constants.each do |constant|
      assert MusicXML::Node.const_defined?(constant)

      klass = MusicXML::Node.const_get(constant)
      assert klass.respond_to?(:stored_attributes)
      assert klass.respond_to?(:stored_nodes)
    end
  end
end
