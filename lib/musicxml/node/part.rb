module MusicXML
  module Node

    register :part do
      pnodes :measure

      def to_lilypond
        notes = []
        source = ['\\new Staff {']

        measure.each do |measure|
          source << measure.to_lilypond
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
