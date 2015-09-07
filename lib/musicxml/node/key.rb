module MusicXML
  module Node

    register :key do
      sattrs :fifths, :mode

      def humanize
        @key_signature ||= KeySignature.new(fifths.to_i)
        @key_signature.humanize
      end
    end
  end
end
