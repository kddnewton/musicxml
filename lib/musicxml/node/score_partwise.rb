module MusicXML
  module Node

    register :score_partwise do
      attrs :movement_title
      nodes :defaults, :identification, :part, :part_list

      def to_lilypond
        ::Lilypond::Converter.new(self).convert
      end

      def to_vexflow
        ::Vexflow::Converter.new(self).convert
      end
    end
  end
end
