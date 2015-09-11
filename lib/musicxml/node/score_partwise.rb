module MusicXML
  module Node

    register :score_partwise do
      sattrs :movement_title

      pnodes :defaults, :part_list, :part
      snodes :identification

      include LilypondExport
    end
  end
end
