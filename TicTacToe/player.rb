class Player
  attr_reader :name, :mark

  def initialize(number)
    puts "Please input player #{number} name:"
    @name = gets.chomp
    puts "Please input player #{number} symbol (X, O or any character):"
    @mark = gets.chomp
    @wins = 0
  end

  def stats
    puts "Player #{@name} has #{@wins} win(s)"
  end

  def won
    @wins += 1
    puts "#{@name} has won the match!"
  end
end
