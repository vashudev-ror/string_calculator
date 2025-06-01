require 'string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns 1 for a single number' do
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns sum for two numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'returns sum for multiple numbers' do
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    it 'supports newlines as delimiter' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum when a custom delimiter is provided' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers with the number in the message' do
      expect { calculator.add('1,-2,3,-4') }.to raise_error('negatives not allowed -2,-4')
    end
  end
end
