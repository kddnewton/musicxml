module MusicXML
  module Node

    register :clef do
      attrs :line, :sign

      # convert a note to lilypond notation
      def to_lilypond
        "\\clef #{sign.first}"
      end

    end
  end
end
