module Lilypond
  class Runner

    attr_accessor :source

    def initialize(score)
      self.source = build_from(score)
    end

    def run
      IO.popen('bin/lilypond', 'w+') do |file|
        file.write(source)
        file.close_write
        file.readlines
      end
    end

    private

      def build_from(score)
        <<-LILYPOND
\\version "#{VERSION}"

\\score {
  #{score.to_lilypond}
}
LILYPOND
      end
  end
end
