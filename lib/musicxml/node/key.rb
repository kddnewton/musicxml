module MusicXML
  module Node

    register :key do
      attrs :fifths, :mode

      def humanize
        @key_signature ||= KeySignature.new(fifths.first.to_i)
        @key_signature.humanize
      end
    end
  end
end
