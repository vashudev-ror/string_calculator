require "string_calculator"

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end
    
    it 'returns the number when a single number is passed' do
      expect(subject.add("1")).to eq(1)
    end
  end
end
