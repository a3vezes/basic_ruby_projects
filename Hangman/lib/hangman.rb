require './lib/word_generator'
require './lib/display'
require './lib/guess'
require './lib/loader'

class Hangman
  include WordGenerator
  include Display
  include Guess
  include Loader

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
    puts 'Type Save To Save This Match'
  end

  def check_player_won
    @word.eql?(@display_word.join)
  end

  def check_saved_game(guess)
    guess == 'save'
  end

  def play
    while @tries > @misses.length
      clear_console

      display_hangman_options

      guess = make_guess

      saved_game = check_saved_game(guess)
      break if saved_game

      check_answer(guess)

      won = check_player_won

      break if won
    end
    display_word(@word) unless won || saved_game
    won
  end
end
