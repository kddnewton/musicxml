module MusicXML
  module Node

    register :time do
      sattrs :beats, :beat_type

      # convert a note to lilypond notation
      def to_lilypond
        "\\time #{beats.to_i}/#{beat_type.to_i}"
      end
    end
  end
end
