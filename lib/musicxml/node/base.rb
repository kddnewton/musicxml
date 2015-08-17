module MusicXML
  module Node
    class Base

      attr_accessor :attributes, :nodes

      def initialize(node)
        self.attributes = {}
        self.nodes = {}
        parse_node(node)
      end

      private

        def find_class(name)
          ::MusicXML::Node.const_get(xml_to_class(name))
        end

        def parse_attributes(node)
          self.class.stored_attributes.each do |attribute|
            attribute_nodes = node.search(attribute)
            attributes[xml_to_key(attribute)] = attribute_nodes.map(&:content) if attribute_nodes
          end
        end

        def parse_nodes(node)
          self.class.stored_nodes.each do |node_name|
            klass = find_class(node_name)
            nodes[xml_to_key(node_name)] = node.search(node_name).map do |child_node|
              klass.new(child_node)
            end
          end
        end

        def parse_node(node)
          parse_attributes(node)
          parse_nodes(node)
        end

      class << self
        attr_accessor :stored_attributes, :stored_nodes

        def attrs(*names)
          self.stored_attributes += names
        end

        def nodes(*names)
          self.stored_nodes += names
        end

        def inherited(subclass)
          subclass.stored_attributes = []
          subclass.stored_nodes = []
        end
      end
    end
  end
end
