class Substrings
  def substrings(strings, dictionary)
    result = {}

    dictionary.each do |word|
      count = strings.downcase.scan(word).count
      result[word] =  count unless count == 0
    end
    result
  end
end
