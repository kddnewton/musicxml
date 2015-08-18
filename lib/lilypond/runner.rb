module Lilypond
  class Runner

    attr_accessor :source

    def initialize(score)
      self.score = score
    end

    def run
      IO.popen('bin/lilypond', 'w+') do |file|
        file.write(score.to_lilypond)
        file.close_write
        file.readlines
      end
    end
  end
end
