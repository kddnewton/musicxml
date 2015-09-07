module MusicXML
  module Node

    # Superclass for all node types
    class Base

      # Build a Parser to parse the node based on this class' config
      def initialize(node)
        Parser.new(node: node, config: self.class.config).parse.each do |key, value|
          instance_variable_set(key, value)
        end
      end

      class << self
        # forward class methods to the config to store the configuration
        extend Forwardable
        def_delegators :config, :pattrs, :pnodes, :sattrs, :snodes

        attr_accessor :config

        # when this class is subclassed build a new config
        def inherited(subclass)
          subclass.config = ::MusicXML::Node::Config.new(subclass)
        end
      end
    end
  end
end
