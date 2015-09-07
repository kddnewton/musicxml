module MusicXML
  module Node
    class Config

      attr_accessor :clazz, :plural_attrs, :plural_nodes, :singular_attrs, :singular_nodes

      def initialize(clazz)
        self.clazz = clazz
        %w[plural_attrs plural_nodes singular_attrs singular_nodes].each do |name|
          send("#{name}=", [])
        end
      end

      def pattrs(*names)
        self.plural_attrs += names
        add_accessors(*names)
      end

      def pnodes(*names)
        self.plural_nodes += names
        add_accessors(*names)
      end

      def sattrs(*names)
        self.singular_attrs += names
        add_accessors(*names)
      end

      def snodes(*names)
        self.singular_nodes += names
        add_accessors(*names)
      end

      private

        def add_accessors(*names)
          clazz.class_eval do
            attr_accessor *names
          end
        end
    end
  end
end
