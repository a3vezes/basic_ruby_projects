class Substrings
  def substrings(strings, dictionary)
    dictionary.reduce(Hash.new(0)) do |result, word|
      strings.split(' ').each do |s|
        result[word] += 1 if s.downcase.include? word
      end  
      result
    end
  end
end