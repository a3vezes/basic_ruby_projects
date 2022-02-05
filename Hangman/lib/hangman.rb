require './lib/word_generator'
require './lib/display'
require './lib/guess'

class Hangman
  include WordGenerator
  include Display
  include Guess

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
