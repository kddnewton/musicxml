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
        source << '\\new Staff {'
        notes = []
        part.measure.each do |measure|
          source << MusicXML::KeySignature.new(measure.key.fifths.to_i).to_lilypond if measure.key
          source << measure.clef.to_lilypond if measure.clef
          source << measure.time.to_lilypond if measure.time
          measure.note.compact.each do |note|
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
