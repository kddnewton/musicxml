module Lilypond
  class Converter

    attr_accessor :score

    def initialize(score)
      self.score = score
    end

    def convert
      source = []
      source << "\\version \"#{VERSION}\""

      score.part.each do |part|
        source << '{'
        notes = []
        part.measure.each do |measure|
          measure.note.each do |note|
            notes << note.to_lilypond
          end
        end
        source << "  #{notes.join(' ')}"
        source << '}'
      end
      source.join("\n")
    end
  end
end
