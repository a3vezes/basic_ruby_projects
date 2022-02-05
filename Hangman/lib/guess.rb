module Guess
  def make_guess
    puts 'Make a guess'
    gets.chomp.to_s.downcase[0] || 'a'
  end

  def correct_guess_indexes(guess)
    indexes = []
    @word.each_char.with_index do |char, index|
      guess == char && indexes << index
    end
    indexes
  end

  def correct_guess_display_word(guess, indexes)
    indexes.each { |index| @display_word[index] = guess }
  end

  def check_answer(guess)
    if @word.include? guess
      correct_guess(guess)
    else
      incorrect_guess(guess)
    end
  end

  def correct_guess(guess)
    indexes = correct_guess_indexes(guess)

    correct_guess_display_word(guess, indexes)
  end

  def incorrect_guess(guess)
    @misses << guess unless @misses.include? guess
  end
end
