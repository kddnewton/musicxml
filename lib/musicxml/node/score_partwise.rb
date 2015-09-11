module MusicXML
  module Node

    register :score_partwise do
      sattrs :movement_title

      pnodes :defaults, :part_list, :part
      snodes :identification

      def to_lilypond
        source = "\\version \"#{::MusicXML::LILYPOND_VERSION}\""
        part.each { |part| source << part.to_lilypond }
        source
      end
    end
  end
end
