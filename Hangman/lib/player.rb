class Player
  def initialize
    puts 'Please input your name:'
    @name = gets.chomp
    @wins = 0
    @losses = 0
  end

  def stats
    puts "Player #{@name} has #{@wins} win(s) and #{@losses} loss(es)"
  end

  def won
    @wins += 1
    puts "#{@name} Won The Match"
  end

  def lost
    @losses += 1
    puts "#{@name} Lost The Match"
  end
end
