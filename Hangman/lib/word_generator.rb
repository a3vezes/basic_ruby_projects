module WordGenerator
  def generate_word
    words = File.open('clear_words.txt', 'r')
    words.readlines.sample
  end
end
