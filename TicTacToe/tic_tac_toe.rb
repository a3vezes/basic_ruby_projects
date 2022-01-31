require './player'
require './board'
require './display'

class TicTacToe
  include Display

  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)    
  end

  def menu(option=0)
    clear_console()

    until option == 3
      menu_options()

      option = gets.chomp.to_i

      if option == 1
        play()
      elsif option == 2
        scores()
      elsif option == 3
        say_bye()
      else
        invalid_option()
      end
    end
  end

  def scores
    @player1.stats
    @player2.stats
  end

  def keep_playing
    puts "Do you wanna keep playing? (Y/N)"
    gets.chomp.upcase == 'Y' ? true : false
  end

  def is_p1_first(player)
    puts "Is #{player.name} going first? (Y/N)"
    gets.chomp.upcase == 'Y' ? true : false
  end

  def player_move(player)
    puts "#{player.name}'s turn, please make a move(0..8)"

    valid_input = false
    until valid_input
      valid_input = @board.make_move(player.mark, gets.chomp.to_i)
      puts invalid_option() unless valid_input
    end

    if @board.solved?(player.mark)
      player.won
      return true
    end
  end

  def play
    keep_playing = true

    while keep_playing
      @board = Board.new

      turn = 0

      is_p1_first = is_p1_first(@player1)

      loop do
        turn += 1
        clear_console()
        @board.board_state
        break if player_move(is_p1_first ? @player1 : @player2)

        turn += 1
        clear_console()
        @board.board_state
        break if turn > 9
        break if player_move(is_p1_first ? @player2 : @player1)      
      end

      puts "Draw Game!" if turn > 9

      keep_playing = keep_playing()
    end
  end

end

