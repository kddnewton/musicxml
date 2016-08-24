module MusicXML
  module Node

    register :measure do
      sattrs :sound
      snodes :clef, :direction, :key, :time, :barline
      pnodes :note

      def to_lilypond
        optional_nodes.join("\n") + "\n"
      end

      private

      def optional_nodes
        [
          (MusicXML::KeySignature.new(measure.key.fifths.to_i).to_lilypond if key),
          (clef.to_lilypond if clef),
          (time.to_lilypond if time)
        ]
      end
    end
  end
end
