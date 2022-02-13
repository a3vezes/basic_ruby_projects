# frozen_string_literal: true

require './lib/calculator'

# Defines An Example Group Params: Class Or String
describe Calculator do
  # Convention for instance method #method
  describe '#add' do
    # it keyword defines an individual example
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
  end

  it 'returns the sum of more than two numbers' do
    calculator = Calculator.new
    expect(calculator.add(2, 5, 7)).to eql(14)
  end
end
