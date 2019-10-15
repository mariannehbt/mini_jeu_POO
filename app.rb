require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# On créé des instances (= joueurs) en définissant leurs variables d'instances @name
player1 = Player.new("Josiane")
player2 = Player.new("José")

# On boucle de façon à ce que les joueurs s'attaquent jusqu'à ce que l'un des deux n'ait plus de point de vie
while player1.life_points > 0 && player2.life_points > 0 do
  # On présente les joueurs (avec puts) et on affiche leurs états (avec la méthode show_state)
  puts
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  puts
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points == 0
  player2.attacks(player1)
  break if player1.life_points == 0
end

binding.pry