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

    register :barline do
      snodes :repeat
    end

    register :chord

    register :clef do
      sattrs :line, :sign
    end

    register :defaults do
      sattrs :music_font, :word_font
    end

    register :direction do
      snodes :direction_type
    end

    register :direction_type do
      pattrs :words, :dynamics
    end

    register :dot

    register :encoding do
      pattrs :supports
      sattrs :encoding_data, :software
    end

    register :identification do
      sattrs :creator, :rights
      snodes :encoding
    end

    register :key do
      sattrs :fifths, :mode

      def humanize
        (@key_signature ||= KeySignature.new(fifths.to_i)).humanize
      end
    end

    register :measure do
      sattrs :sound
      snodes :clef, :direction, :key, :time, :barline, :transpose
      pnodes :note
    end

    register :notations do
      pnodes :articulations
      sattrs :arpeggiate, :slur
    end

    register :note do
      sattrs :duration, :staff, :stem, :type, :voice, :accidental

      pnodes :notations, :dot
      snodes :pitch, :chord
    end

    register :part do
      pnodes :measure
    end

    register :part_list do
      pnodes :score_part
    end

    register :pitch do
      sattrs :step, :alter, :octave
    end

    register :repeat do
      props :direction, :times
    end

    register :score_instrument do
      sattrs :instrument_name
    end

    register :score_part do
      sattrs :part_name
      snodes :score_instrument
    end

    register :score_partwise do
      sattrs :movement_title

      pnodes :defaults, :part
      snodes :identification, :part_list
    end

    register :time do
      sattrs :beats, :beat_type
    end

    register :transpose do
      sattrs :diatonic, :chromatic, :octave
    end
  end
end
