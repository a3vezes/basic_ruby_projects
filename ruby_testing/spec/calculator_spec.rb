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

    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe '#multiply' do
    it 'returns the multiplication of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(3, 7)).to eql(21)
    end
  end

  describe '#subtract' do
    it 'returns the subtraction of two numbers' do
      calculator = Calculator.new
      expect(calculator.subtract(8, 4)).to eql(4)
    end

    it 'returns a negative number, if the first number is smaller' do
      calculator = Calculator.new
      expect(calculator.subtract(4, 8)).to eql(-4)
    end
  end

  describe '#divide' do
    it 'returns the division of two numbers' do
      calculator = Calculator.new
      expect(calculator.divide(6, 3)).to eql(2)
    end

    it 'doesn\'t raises an error when dividing by 0' do
      calculator = Calculator.new
      # { } creates a block to monitor for the exception to be raised
      expect { calculator.divide(5, 0) }.to_not raise_error
    end

    it 'returns a message when dividing by 0' do
      calculator = Calculator.new
      expect(calculator.divide(5, 0)).to eql('I can\'t divide by zero')
    end
  end
end
