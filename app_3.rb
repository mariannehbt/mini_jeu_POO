require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
  ______   _____    _____   _    _   _______ 
 |  ____| |_   _|  / ____| | |  | | |__   __|
 | |__      | |   | |  __  | |__| |    | |   
 |  __|     | |   | | |_ | |  __  |    | |   
 | |       _| |_  | |__| | | |  | |    | |   
 |_|      |_____|  \_____| |_|  |_|    |_|   
                                             
                                             
"

puts "Quel est ton prénom ?"
print "> "
human_player_name = gets.chomp

my_game = Game.new(human_player_name)


binding.pry


