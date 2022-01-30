require './player'
require './board'

class TicTacToe
  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)    
  end

  def menu(option=0)
    puts `clear`
    until option == 3
      puts "Welcome to Tic-tac-toe"
      puts "Press (1) to play"
      puts "Press (2) to see scores"
      puts "Press (3) to quit"

      option = gets.chomp.to_i

      if option == 1
        play()
      elsif option == 2
        scores()
      elsif option == 3
        puts "Bye!"
      else
        puts "Please input 1, 2 or 3"
      end
    end
  end

  def scores
    @player1.stats
    @player2.stats
  end

  def player_move(player)
    puts "#{player.name}'s turn, please make a move(0..8)"
    @board.make_move(player.mark, gets.chomp.to_i)
    if @board.solved?(player.mark)
      player.won
      return true
    end
  end

  def play
    keep_playing = true

    while keep_playing
      @board = Board.new
      turn = 1
      length = @board.board.length
      puts "Is #{@player1.name} going first? (Y/N)"
      is_p1_first = gets.chomp.upcase == 'Y' ? true : false

      while turn < length - 1
        puts `clear`
        @board.board_state
        break if player_move(is_p1_first ? @player1 : @player2)

        puts `clear`
        @board.board_state
        break if player_move(is_p1_first ? @player2 : @player1)      
        turn += 1
      end

      puts "Draw Game!" if turn == length
      puts "Do you wanna keep playing? (Y/N)"
      keep_playing = gets.chomp.upcase == 'Y' ? true : false
    end
  end

end

t = TicTacToe.new
t.menu