module Display
  def menu_options
    puts "Welcome to Tic-tac-toe"
    puts "Press (1) to play"
    puts "Press (2) to see scores"
    puts "Press (3) to quit"
  end

  def say_bye
    puts "Bye!"
  end

  def invalid_option
    puts "Please input a valid option"
  end

  def clear_console
    puts `clear`
  end
end