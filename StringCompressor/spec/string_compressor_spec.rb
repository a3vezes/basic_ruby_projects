# frozen_string_literal: true

# spec/string_compressor_spec.rb
require '../string_compressor'

describe StringCompressor do
  subject { StringCompressor.new }

  describe '#string_compressor' do
    it 'works with a single character' do
      expect(subject.compress('AAA')).to eql('3A')
    end

    it 'works with multiple characters' do
      expect(subject.compress('AAABBBCCC')).to eql('3A3B3C')
    end

    it 'works with more than 9 characters' do
      expect(subject.compress('AAAAAAAAAAAA')).to eql('9A3A')
    end

    it 'works with special characters' do
      expect(subject.compress('---***')).to eql('3-3*')
    end

    it 'works with a long string' do
      expect(subject.compress('BBBBBBBBBBBBBAACCCDD')).to eql('9B4B2A3C2D')
    end

    it 'works with a mixed long string' do
      expect(subject.compress('-----BBBBCCC    ...')).to eql('5-4B3C4 3.')
    end
  end
end
