def substrings(strings, dictionary)
  dictionary.reduce(Hash.new(0)) do |result, word|
    result[word] += 1 if strings.downcase.include? word
    result
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#puts substrings("below", dictionary)
# puts substrings("Howdy partner, sit down! How's it going?", dictionary)

# h1 = { a: 100, b: 200 }
# h2 = { a: 246, b: 300 }
# puts h1.merge(h2)