require 'test_helper'

class NodeTest < Minitest::Test

  def test_register
    register_test_node do
      assert MusicXML::Node.const_defined?(:TestNode)
      assert_equal 'test', MusicXML::Node::TestNode.echo('test')
    end
  end

  def test_registry
    register_test_node do
      assert MusicXML::Node.registry.keys.include?(:test_node)
      assert_equal MusicXML::Node::TestNode, MusicXML::Node.registry[:test_node]
    end
  end

  def test_registration
    constants = MusicXML::Node.registry.keys.map do |name|
      name.to_s.capitalize.gsub(/_([a-z])/) { $1.upcase }.to_sym
    end

    constants.each do |constant|
      assert MusicXML::Node.const_defined?(constant)

      clazz = MusicXML::Node.const_get(constant)
      assert clazz.respond_to?(:config)
    end
  end

  private

  def register_test_node
    MusicXML::Node.register :test_node do
      def self.echo(string)
        string
      end
    end

    yield

    MusicXML::Node.registry.delete(:test_node)
    MusicXML::Node.send(:remove_const, :TestNode)
  end
end
