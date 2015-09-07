module Vexflow
  class Converter

    attr_accessor :score

    def initialize(score)
      self.score = score
    end

    def convert
      score.vexflow_hash.to_json
    end
  end
end
