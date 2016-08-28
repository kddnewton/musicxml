module MusicXML
  class Parser

    attr_reader :filepath, :score

    def initialize(filepath)
      @filepath = filepath
      validate_filepath
    end

    def parse
      document = Nokogiri::XML(File.read(filepath))
      @score = Node::ScorePartwise.new(document.at('score-partwise'))
    end

    private

    def validate_filepath
      raise ArgumentError, "Invalid filepath given: #{filepath}" unless File.file?(filepath)
    end
  end
end
