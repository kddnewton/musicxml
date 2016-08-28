module MusicXML
  class KeySignature

    FIFTHS = %w[Gb Db Ab Eb Bb F C G D A E B F#].freeze

    attr_reader :number

    def initialize(number)
      @number = number
    end

    def humanize
      FIFTHS[number + 6]
    end
  end
end
