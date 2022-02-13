# frozen_string_literal: true

# spec/caesar_spec.rb
require './main'

describe CaesarCipher do
  subject { CaesarCipher.new }

  describe '#caesar_cipher' do
    it 'works with small positive shift' do
      expect(subject.caesar_cipher('Zz', 5)).to eql('Ee')
    end

    it 'works with small negative shift' do
      expect(subject.caesar_cipher('Ee', -5)).to eql('Zz')
    end

    it 'works with large positive shift' do
      expect(subject.caesar_cipher('Zz', 83)).to eql('Ee')
    end

    it 'works with large negative shift' do
      expect(subject.caesar_cipher('Ee', -83)).to eql('Zz')
    end

    it 'works with a phrase with punctuation' do
      expect(subject.caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end

    it 'works with a phrase with a large shift' do
      expect(subject.caesar_cipher('Hello, World!', 75)).to eql('Ebiil, Tloia!')
    end

    it 'works with a phrase with a large negative shift' do
      expect(subject.caesar_cipher('Hello, World!', -55)).to eql('Ebiil, Tloia!')
    end
  end
end
