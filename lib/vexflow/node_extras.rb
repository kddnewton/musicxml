module Vexflow
  module NodeExtras
    def vexflow_hash
      { vexflow_key => self.vexflow_values }
    end

    def vexflow_values
      output = {}

      self.class.config.singular_attrs.each do |name|
        output[name] = send(name)
      end
      self.class.config.plural_attrs.each do |name|
        output[name] = send(name) || []
      end

      self.class.config.singular_nodes.each do |name|
        node = send(name)
        output.merge(node.vexflow_hash) if node
      end
      self.class.config.plural_nodes.each do |name|
        nodes = send(name)
        output[name] = nodes ? nodes.map(&:vexflow_values) : []
      end

      output
    end

    private

      def vexflow_key
        self.class.name.split('::').last.gsub(/([A-Z])/) { '_' + $1.downcase }.gsub(/^_/, '')
      end
  end
end

MusicXML::Node::Base.include(Vexflow::NodeExtras)
