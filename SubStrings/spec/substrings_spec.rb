# frozen_string_literal: true

# spec/substrings.rb
require '../main.rb'

describe Substrings do
  subject { Substrings.new }

  describe '#substrings' do
    it 'works with a empty dictionary' do
      expect(subject.substrings('A B C', [])).to eql({})
    end

    it 'works with a single character' do
      expect(subject.substrings('a', ['a'])).to eql({'a' => 1})
    end

    it 'works with multiple single characters' do
      expect(subject.substrings('a b c', ['a', 'b', 'c'])).to eql({'a' => 1, 'b' => 1, 'c' => 1})
    end

    it 'works with multiple cases' do
      expect(subject.substrings('A b C', ['a', 'b', 'c'])).to eql({'a' => 1, 'b' => 1, 'c' => 1})
    end

    it 'works with a string with punctuation' do
      expect(subject.substrings('a! b? c:', ['a', 'b', 'c'])).to eql({'a' => 1, 'b' => 1, 'c' => 1})
    end

    it 'works with upercased dictionary' do
      expect(subject.substrings('a b c', ['A', 'B', 'C'])).to eql({'a' => 1, 'b' => 1, 'c' => 1})
    end

    it 'works with a single word' do
      expect(subject.substrings('below', ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])).to eql({"below" => 1, "low" => 1})
    end

    it 'works with multiple words' do
      expect(subject.substrings("Howdy partner, sit down! How's it going?", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])).to eql({"down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1})
    end
  end
end