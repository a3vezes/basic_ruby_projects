require './lib/player'
require './lib/display'
require './lib/hangman'

class Menu
  include Display

  def initialize
    @player = Player.new
  end

  def create_hangman(load_game = false)
    hangman = Hangman.new
    hangman.load_game if load_game
    won = hangman.play
    won ? @player.won : @player.lost
  end

  def options(option)
    case option
    when 1
      create_hangman
    when 2
      @player.stats
    when 3
      create_hangman(true)
    when 4
      puts 'Bye!'
    else
      invalid_option
    end
  end

  def menu_options
    display_menu_options
    gets.chomp.to_i
  end

  def menu(option = 0)
    clear_console

    until option == 4
      option = menu_options

      options(option)
    end
  end
end
