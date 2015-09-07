module MusicXML
  module Node
    module JsonExport
      def to_json
        { json_key => json_values }.to_json
      end

      def json_key
        self.class.name.split('::').last.gsub(/^([A-Z])/) { $1.downcase }
      end

      def json_values
        output = {}

        self.class.config.singular_attrs.each do |name|
          output[jsify(name)] = send(name)
        end
        self.class.config.plural_attrs.each do |name|
          output[jsify(name)] = send(name) || []
        end

        self.class.config.singular_nodes.each do |name|
          node = send(name)
          output[jsify(name)] = node ? node.json_values : nil
        end
        self.class.config.plural_nodes.each do |name|
          nodes = send(name)
          output[jsify(name)] = nodes ? nodes.map(&:json_values) : []
        end

        self.class.config.properties.each do |name|
          output[jsify(name)] = send(name)
        end

        output
      end

      private

        def jsify(name)
          name.to_s.gsub(/(_[a-z])/) { $1.upcase[1..-1] }
        end
    end
  end
end
