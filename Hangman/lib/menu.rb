require './lib/player'
require './lib/display'

class Menu
  include Display

  def initialize
    @player = Player.new
  end

  # Change Method Name?
  def options(option)
    case option
    when 1
      puts 'Play'
    when 2
      puts 'Score'
    when 3
      puts 'Load Game'
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
