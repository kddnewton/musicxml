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
end
