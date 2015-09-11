module MusicXML
  module Node

    register :clef do
      sattrs :line, :sign

      # convert a note to lilypond notation
      def to_lilypond
        "\\clef #{sign}"
      end
    end
  end
end
