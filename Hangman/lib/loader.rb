require 'json'

module Loader
  @@dirname = 'saved_games'

  def create_dir
    Dir.mkdir(@@dirname) unless File.exist? @@dirname
  end

  def dir_length
    Dir.glob("#{@@dirname}/*").length + 1
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

  def load(game_name)
    obj = JSON.load File.read("#{@@dirname}/#{game_name}")
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  rescue StandardError
    invalid_option
  end

  def load_game
    create_dir

    display_all_saved_games

    game_name = set_game_name

    load(game_name)
  end

  def set_game_name
    puts 'Type The Saved Game Name (A New Game Will Be Created, If Wrong Name)'
    gets.chomp.downcase
  end

  def display_all_saved_games
    puts Dir.children(@@dirname)
  end
end
