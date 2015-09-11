module MusicXML
  module Node

    register :measure do
      sattrs :sound
      snodes :clef, :direction, :key, :time
      pnodes :note

      def to_lilypond
        source = []
        source << MusicXML::KeySignature.new(measure.key.fifths.to_i).to_lilypond if key
        source << clef.to_lilypond if clef
        source << time.to_lilypond if time
        source.join("\n") + "\n"
      end
    end
  end
end
