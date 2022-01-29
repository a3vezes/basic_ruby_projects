class Substrings
  def substrings(strings, dictionary)
    result = {}
    downcased_strings = strings.downcase

    dictionary.each do |word|
      downcased_word = word.downcase
      count = downcased_strings.scan(downcased_word).count
      result[downcased_word] =  count unless count == 0
    end
    result
  end
end
