module MusicXML
  module Utilities
    class XMLString

      attr_accessor :content

      def initialize(content)
        self.content = content
      end

      def to_class
        content.capitalize.gsub(/\-([a-z])/) { $1.to_s.upcase }
      end

      def to_key
        content.gsub('-', '_').to_sym
      end
    end
  end
end
