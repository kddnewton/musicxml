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
  end
end
