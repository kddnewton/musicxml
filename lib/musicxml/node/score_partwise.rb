module MusicXML
  module Node

    register :score_partwise do
      sattrs :movement_title

      pnodes :defaults, :part_list, :part
      snodes :identification

      def to_lilypond
        ::Lilypond::Converter.new(self).convert
      end

      def to_vexflow
        ::Vexflow::Converter.new(self).convert
      end
    end
  end
end
