class Player
  def initialize
    puts 'Please input your name:'
    @name = gets.chomp
    @wins = 0
  end

  def stats
    puts "Player #{@name} has #{@wins} win(s)"
  end
end
