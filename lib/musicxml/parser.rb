module MusicXML
  class Parser

    attr_accessor :filepath, :score

    def initialize(filepath)
      self.filepath = filepath
      validate_filepath
    end

    def parse
      document = Nokogiri::XML(File.read(filepath))
      self.score = Node::ScorePartwise.new(document.at('score-partwise'))
    end

    private

      def validate_filepath
        fail ArgumentError, "Invalid filepath given: #{filepath}" unless File.file?(filepath)
      end
  end
end
