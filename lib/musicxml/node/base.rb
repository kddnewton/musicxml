module MusicXML
  module Node
    class Base

      def initialize(node)
        parse_node(node)
      end

      private

        def find_class(name)
          ::MusicXML::Node.const_get(name)
        end

        def parse_attributes(node)
          self.class.stored_attributes.each do |name|
            attribute_nodes = node.search(symbol_to_node(name))
            instance_variable_set(:"@#{name}", attribute_nodes.map(&:content)) unless attribute_nodes.nil?
          end
        end

        def parse_nodes(node)
          self.class.stored_nodes.each do |name|
            klass = find_class(symbol_to_class(name))
            node_list = node.search(symbol_to_node(name)).map do |child_node|
              begin
                klass.new(child_node)
              rescue => exception
                puts "Could not create node of type #{klass}: #{exception.message}"
                puts child_node
              end
            end
            instance_variable_set(:"@#{name}", node_list) if node_list.any?
          end
        end

        def parse_node(node)
          parse_attributes(node)
          parse_nodes(node)
        end

        def symbol_to_class(name)
          name.to_s.capitalize.gsub(/\_([a-z])/) { $1.to_s.upcase }.to_sym
        end

        def symbol_to_node(name)
          name.to_s.gsub('_', '-')
        end

      class << self
        attr_accessor :stored_attributes, :stored_nodes

        def attrs(*names)
          self.stored_attributes += names
          attr_accessor *names
        end

        def nodes(*names)
          self.stored_nodes += names
          attr_accessor *names
        end

        def inherited(subclass)
          subclass.stored_attributes = []
          subclass.stored_nodes = []
        end
      end
    end
  end
end
