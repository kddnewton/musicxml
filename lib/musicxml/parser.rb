module MusicXML
  class Parser

    attr_accessor :filepath, :score

    def initialize(filepath)
      self.filepath = filepath
      validate_filepath
    end

    def parse(thing = false)
      document = Nokogiri::XML(File.read(filepath))
      self.score = Node::ScorePartwise.new(document.at('score-partwise'))
    end

    private

      def validate_filepath
        unless File.file?(filepath)
          raise ArgumentError, "Invalid filepath given: #{filepath}"
        end
      end
  end
end
