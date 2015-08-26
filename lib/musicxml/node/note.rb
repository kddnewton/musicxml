module MusicXML
  module Node

    register :note do
      attrs :duration, :staff, :stem, :type, :voice
      nodes :notations, :pitch

      # convert a note to lilypond notation
      def to_lilypond
        repr = step
        repr << lilypond_octave
        repr << lilypond_duration.to_s
        repr
      end

      # convert a note to vexflow notation
      def to_vexflow
        { keys: vexflow_keys, duration: vexflow_duration }
      end

      private

        def lilypond_duration
          case type.first
          when '16th' then 16
          when 'eighth' then 8
          when 'quarter' then 4
          when 'half' then 2
          when 'whole' then 1
          else ''
          end
        end

        def lilypond_octave
          if octave > 3
            '\'' * (octave - 3)
          elsif octave < 3
            ',' * (3 - octave)
          else
            ''
          end
        end

        def octave
          @octave ||= pitch.first.octave.first.to_i
        end

        def step
          @step ||= pitch.first.step.first.downcase
        end

        def vexflow_duration
          case type.first
          when '16th' then '16'
          when 'eighth' then '8'
          when 'quarter' then 'q'
          when 'half' then 'h'
          when 'whole' then 'w'
          else ''
          end
        end

        def vexflow_keys
          ["#{step}/#{octave}"]
        end
    end
  end
end
