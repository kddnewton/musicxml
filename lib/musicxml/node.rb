module MusicXML
  module Node

    def self.register(name, &block)
      class_name = name.to_s.capitalize.gsub(/\_([a-z])/) { $1.to_s.upcase }
      klass = Class.new(Base)
      const_set(class_name.to_sym, klass)
      klass.class_eval(&block) if block_given?
    end

    register :attributes do
      attrs :divisions, :staves
      nodes :clef, :key
    end

    register :clef do
      attrs :line, :sign
    end

    register :defaults do
      attrs :music_font, :word_font
    end

    register :encoding do
      attrs :encoding_data, :software, :supports
    end

    register :identification do
      attrs :creator, :rights
      nodes :encoding
    end

    register :measure do
      attrs :sound
      nodes :note
    end

    register :note do
      attrs :duration, :staff, :stem, :type, :voice
      nodes :notations, :pitch
    end

    register :notations do
      attrs :arpeggiate
    end

    register :part do
      nodes :measure
    end

    register :part_list do
      nodes :score_part
    end

    register :pitch do
      attrs :step, :alter, :octave
    end

    register :score_instrument do
      attrs :instrument_name
    end

    register :score_part do
      attrs :part_name
      nodes :score_instrument
    end
  end
end
