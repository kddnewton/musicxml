module MusicXML
  # Namespace for all nodes defined by the system. Nodes are used
  # to represent the various segments of the XML describing different
  # musical concepts.
  module Node

    class << self
      attr_accessor :registry
    end
    self.registry = {}

    def self.register(name, &block)
      class_name = name.to_s.capitalize.gsub(/\_([a-z])/) { $1.to_s.upcase }
      clazz = Class.new(Base, &block)

      registry[name] = clazz
      const_set(class_name.to_sym, clazz)
    end

    register :articulations do
      sattrs :accent, :breath_mark, :staccato, :tenuto
    end

    register :attributes do
      pattrs :divisions, :staves
      snodes :clef, :key, :transpose
    end

    register :transpose do
      sattrs :diatonic, :chromatic, :octave
    end

    register :direction do
      snodes :direction_type
    end

    register :direction_type do
      pattrs :words, :dynamics
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

    register :notations do
      pnodes :articulations
      sattrs :arpeggiate, :slur
    end

    register :part_list do
      pnodes :score_part
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

    register :chord do
    end

    register :barline do
      snodes :repeat
    end

    register :repeat do
      props :direction, :times
    end

    register :dot do
    end

  end
end
