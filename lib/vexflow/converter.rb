module Vexflow
  class Converter

    attr_accessor :score

    def initialize(score)
      self.score = score
    end

    def convert
      output = {}
      score.part.each_with_index do |part, index|
        notes = []
        part.measure.each do |measure|
          measure.note.each do |note|
            notes << note.to_vexflow
          end
        end
        output["part_#{index}"] = notes
      end
      output.to_json
    end
  end
end
