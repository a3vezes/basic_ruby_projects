class ClearWords
  def self.open_input(input)
    File.open(input, 'r')
  end

  def self.get_clear_words(words)
    words.select { |word| word.length.between?(5, 12) }
  end

  def self.create_output(words, output)
    File.open(output, 'w') do |file|
      file.puts words
    end
  end

  def self.clear_words(input, output)
    input_file = open_input(input)

    clear_words = get_clear_words(input_file)

    create_output(clear_words, output)
  end
end
