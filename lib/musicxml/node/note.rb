module MusicXML
  module Node

    register :note do
      attrs :duration, :staff, :stem, :type, :voice
      nodes :notations, :pitch

      # convert a note to lilypond notation
      def to_lilypond
        repr = pitch.first.step.first.downcase

        octave = pitch.first.octave.first.to_i
        repr << if octave > 3
          '\'' * (octave - 3)
        elsif octave < 3
          ',' * (3 - octave)
        else
          ''
        end

        duration = case type.first
        when '16th' then 16
        when 'eighth' then 8
        when 'quarter' then 4
        when 'half' then 2
        when 'whole' then 1
        else ''
        end
        repr << duration.to_s

        repr
      end
    end
  end
end
