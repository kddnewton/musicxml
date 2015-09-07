module MusicXML
  module Node

    def self.register(name, &block)
      class_name = name.to_s.capitalize.gsub(/\_([a-z])/) { $1.to_s.upcase }
      const_set(class_name.to_sym, Class.new(Base, &block))
    end

    register :attributes do
      pattrs :divisions, :staves
      snodes :clef, :key
    end

    register :clef do
      sattrs :line, :sign
    end

    register :defaults do
      sattrs :music_font, :word_font
    end

    register :encoding do
      pattrs :supports
      sattrs :encoding_data, :software
    end

    register :identification do
      sattrs :creator, :rights
      snodes :encoding
    end

    register :measure do
      sattrs :sound
      pnodes :note
    end

    register :notations do
      sattrs :arpeggiate
    end

    register :part do
      pnodes :measure
    end

    register :part_list do
      snodes :score_part
    end

    register :pitch do
      sattrs :step, :alter, :octave
    end

    register :score_instrument do
      sattrs :instrument_name
    end

    register :score_part do
      sattrs :part_name
      snodes :score_instrument
    end
  end
end
