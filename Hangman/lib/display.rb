module Display
  def display_menu_options
    puts 'Welcome to Hangman'
    puts 'Press (1) to play'
    puts 'Press (2) to see your score'
    puts 'Press (3) to load a saved game'
    puts 'Press (4) to quit'
  end

  def clear_console
    puts `clear`
  end

  def invalid_option
    puts 'Please input a valid option'
  end
end
