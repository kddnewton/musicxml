module Lilypond
  class Converter

    attr_accessor :score

    def initialize(score)
      self.score = score
    end

    def convert(args = {})
      source = []
      source << "\\version \"#{VERSION}\""

      score.part.each do |part|
        source << '\\new Staff {'
        source << MusicXML::KeySignature.new(args[:key]).to_lilypond if args[:key]
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
