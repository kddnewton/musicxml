module MusicXML
  module Node

    register :time do
      attrs :beats, :beat_type

      # convert a note to lilypond notation
      def to_lilypond
        "\\time #{beats.first.to_i}/#{beat_type.first.to_i}"
      end

    end
  end
end
