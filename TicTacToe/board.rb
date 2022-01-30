class Board
  def initialize
    @board = Array.new(9) {|i| i.to_s}
  end

  def board_state
    puts "--------------------"
    puts @board[0..2].inspect
    puts @board[3..5].inspect
    puts @board[6..8].inspect
    puts "--------------------"
  end

  def make_move(mark, index)
    @board[index] = mark
  end

  def solved?(mark)
    [
      @board[0..2], 
      @board[3..5], 
      @board[6..8],
      [@board[0],@board[3],@board[6]], 
      [@board[1],@board[4],@board[7]],
      [@board[2],@board[5],@board[8]],
      [@board[0],@board[4],@board[8]],
      [@board[2],@board[4],@board[6]]
    ].include?(Array.new(3, mark))
  end
end
