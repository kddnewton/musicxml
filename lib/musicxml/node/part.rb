module MusicXML
  module Node

    register :part do
      pnodes :measure

      def to_lilypond
        source, notes = ['\\new Staff {'], []

        measure.each do |measure|
          source << MusicXML::KeySignature.new(measure.key.fifths.to_i).to_lilypond if measure.key
          source << measure.clef.to_lilypond if measure.clef
          source << measure.time.to_lilypond if measure.time
          measure.note.compact.each do |note|
            notes << note.to_lilypond
          end
        end

        source << "  #{notes.join(' ')}\n}"
        source.join("\n") + "\n"
      end
    end
  end
end
