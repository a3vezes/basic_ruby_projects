require 'json'

module Loader
  @@dirname = 'saved_games'

  def create_dir
    Dir.mkdir(@@dirname) unless File.exist? @@dirname
  end

  def dir_length
    length = Dir.glob("#{@@dirname}/*").length
    length == 1 ? length : length + 1
  end

  def create_json
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    JSON.dump obj
  end

  def save_game
    create_dir

    data = create_json

    file_name = "game-#{dir_length}"

    file = File.open("#{@@dirname}/#{file_name}.json", 'w')
    file.puts data
    file.close

    puts "Game Saved With Name : #{file_name}"
  end
end

# [X] Create saved_games dir
# [X] Check to see if saved_games is created then create it if false
# [X] Save game
## [X] Create new json file in saved_games dir with data @word, @tries, @misses, @display_word
# [] Load game
## [] Display all saved games
### [] Display "No saved games" if no saved games
## [] Gets a name for a saved game
### [] Return @word, @tries, @misses, @display_word to Hangman Class
