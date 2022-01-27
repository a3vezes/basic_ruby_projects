# frozen_string_literal: true

# spec/stock_picker.rb
require '../main.rb'

describe StockPicker do
  subject { StockPicker.new }

  describe '#stock_picker' do
    it 'returns an array' do
      expect(subject.stock_picker([])).to eql([])
    end

    it 'works when the highest day is the first day' do
      expect(subject.stock_picker([17,3,6,9,15,8,6,1,10])).to eql([1,4])
    end

    it 'works when the lowest day is the first day' do
      expect(subject.stock_picker([1,3,6,9,15,8,6,1,10])).to eql([0,4])
    end

    it 'works when the highest day is the last day' do
      expect(subject.stock_picker([10,3,6,9,15,8,6,1,17])).to eql([7,8])
    end

    it 'works when the lowest day is the last day' do
      expect(subject.stock_picker([10,3,6,9,15,8,6,15,1])).to eql([0,4])
    end

  end
end