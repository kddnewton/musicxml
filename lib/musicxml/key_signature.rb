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

    def lilypond_name
      # WTF lilypond.  W. T. F.
      self.humanize.gsub('b', 'es').gsub('#', 'is').downcase
    end

    def to_lilypond
      #TODO: add support for minor keys
      "\\key #{self.lilypond_name} \\major" 
    end
  end
end
