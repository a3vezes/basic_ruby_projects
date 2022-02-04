require './lib/word_generator'
require './lib/display'

class Hangman
  include WordGenerator
  include Display

  def initialize
    @word = generate_word
    @word.strip!
    @tries = @word.length - 1
    @misses = []
    @display_word = Array.new(@word.length, '_')
  end

  def display_hangman_options
    puts "Word: #{@display_word.inspect}"
    puts "Misses: #{@misses.inspect}"
    puts "Try: #{@misses.length + 1}/#{@tries + 1}"
  end

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

  def check_player_won
    @word.eql?(@display_word.join)
  end

  def play
    while @tries > @misses.length
      clear_console

      display_hangman_options

      guess = make_guess

      check_answer(guess)

      won = check_player_won

      break if won
    end
    display_word(@word) unless won
    won
  end
end
