module MusicXML
  class KeySignature

    FIFTHS = %w[Gb Db Ab Eb Bb F C G D A E B F#]

    attr_accessor :number

    def initialize(number)
      self.number = number
    end

    def humanize
      FIFTHS[number + 6]
    end

    def to_lilypond
      # TODO: add support for minor keys
      "\\key #{lilypond_name} \\major"
    end

    private

    # lilypond represents flats as "es" and sharps as "is"
    def lilypond_name
      humanize.gsub('b', 'es').gsub('#', 'is').downcase
    end
  end
end
