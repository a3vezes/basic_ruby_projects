class Player
  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
  end

  def stats
    puts "Player #{@name} has #{@wins} wins and #{@losses} losses"
  end

  def won
    @wins += 1
    puts "Player #{@name} has won the match!"
  end

  def lost
    @losses += 1
    puts "Player #{@name} lost the match!"
  end
end
