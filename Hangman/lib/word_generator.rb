require './utils/clear_words'

module WordGenerator
  def check_file_exists
    ClearWords.clear_words('all_words.txt', 'clear_words.txt') unless File.file?('clear_words.txt')
  end

  def generate_word
    check_file_exists

    words = File.open('clear_words.txt', 'r')
    words.readlines.sample
  end
end
