module MusicXML
  module Node
    # Parses a node to get out the child nodes and attributes
    class Parser

      attr_accessor :config, :node, :parsed

      # Store the given options and build a hash of the parsed nodes
      def initialize(args = {})
        self.config = args[:config]
        self.node   = args[:node]
        self.parsed = {}
      end

      # Loop through each of the configured parsing options and store them
      def parse
        %w[plural_attrs plural_nodes singular_attrs singular_nodes properties].each do |method_name|
          config.send(method_name).each(&method(method_name))
        end
        parsed
      end

      private

        def find_class(name)
          ::MusicXML::Node.registry[name]
        end

        def plural_attrs(name)
          attr_nodes = node.search(symbol_to_node(name))
          set(name, attr_nodes.any? ? attr_nodes.map(&:content) : [])
        end

        def plural_nodes(name)
          clazz = find_class(name)
          node_list = node.search(symbol_to_node(name)).map do |child_node|
            clazz.new(child_node)
          end
          set(name, node_list.any? ? node_list : [])
        end

        def properties(name)
          attr = node.attributes[symbol_to_node(name)]
          
          set(name, attr.nil? ? "" : attr.value)
        end

        def set(key, value)
          parsed[:"@#{key}"] = value
        end

        def singular_attrs(name)
          attr_node = node.at(symbol_to_node(name))
          set(name, attr_node.content) unless attr_node.nil?
        end

        def singular_nodes(name)
          found_node = node.at(symbol_to_node(name))
          set(name, find_class(name).new(found_node)) if found_node
        end

        def symbol_to_node(name)
          name.to_s.tr('_', '-')
        end
    end
  end
end
