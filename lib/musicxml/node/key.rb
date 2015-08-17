module MusicXML
  module Node

    register :key do
      attrs :fifths, :mode

      def humanize
        @key_signature ||= KeySignature.new(attributes[:fifths])
        @key_signature.humanize
      end
    end
  end
end
