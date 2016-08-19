module MusicXML
  module Node

    register :note do
      sattrs :duration, :staff, :stem, :type, :voice

      pnodes :notations
      snodes :pitch, :chord

      props :dot

      # convert a note to lilypond notation
      def to_lilypond
        "#{pitch.step.downcase}#{lilypond_octave}#{lilypond_duration}"
      end

      private

        def lilypond_duration
          case type
          when '16th' then 16
          when 'eighth' then 8
          when 'quarter' then 4
          when 'half' then 2
          when 'whole' then 1
          else ''
          end
        end

        def lilypond_octave
          octave = pitch.octave.to_i
          if octave > 3
            '\'' * (octave - 3)
          elsif octave < 3
            ',' * (3 - octave)
          else
            ''
          end
        end
    end
  end
end
