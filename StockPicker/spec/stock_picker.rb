# frozen_string_literal: true

# spec/stock_picker.rb
require '../main.rb'

describe StockPicker do
  subject { StockPicker.new }

  describe '#stock_picker' do
    it 'returns an array' do
      expect(subject.stock_picker([])).to eql([])
    end
  end
end