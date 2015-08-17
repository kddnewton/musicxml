module MusicXML
  module Node
    class ScorePartwise < Base

      attrs 'movement-title'
      nodes 'defaults', 'identification', 'part', 'part-list'

      def to_lilypond
        ::Lilypond::Converter.new(self)
      end

      def to_vexflow
        ::Vexflow::Converter.new(self)
      end
    end
  end
end
