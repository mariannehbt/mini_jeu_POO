require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Au lancement de app_2.rb, on affiche dans le terminal un petit message de démarrage du jeu
puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

# On initilise un joueur
# Le jeu demande son prénom à l'utilisateur son prénom
puts "Quel est ton prénom ?"
print "> "
human_player_name = gets.chomp
# On créé un HumanPlayer portant ce prénom
player0 = HumanPlayer.new(human_player_name)

# On initilise des ennemis
# On créé un array enemies
enemies = []
# On ajoute les objets Player dans l'array enemies
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")

# On boucle de façon à ce que les joueurs s'attaquent jusqu'à ce que l'un des deux n'ait plus de point de vie
while player0.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  # On affiche le menu
  puts
  puts "Voici ton état :"
  player0.show_state
  puts
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "attaquer un joueur en vue :"
  puts "1 - #{player1.name} a #{player1.life_points} points de vie"
  puts "2 - #{player2.name} a #{player2.life_points} points de vie"
  puts
  # On laisse l'utilisateur effectuer une saisie
  print "> "
  human_player_choice = gets.chomp
  # En fonction de la saisie :
  case human_player_choice
    # si l'utilisateur tape "a", on exécute sur son HumanPlayer la méthode qui le fait partir à la recherche d'une arme
    when "a" then
      player0.search_weapon
    # si l'utilisateur tape "s", on exécute sur son HumanPlayer la méthode qui le fait partir à la recherche d'un pack de soin
    when "s" then
      player0.search_health_pack
    # si l'utilisateur tape "0", on fait attaquer Josiane par son Human Player
    when "1" then
      player0.attacks(player1)
    # si l'utilisateur tape "1", on fait attaquer José par son Human Player
    when "2" then
      player0.attacks(player2)
  end
  break if player1.life_points == 0 && player2.life_points == 0
  puts
  # On fait en sorte que les 2 autres players attaquent l'utilisateur
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |player|
    if player.life_points > 0
    player.attacks(player0)
    end
  end
end

# Le jeu indique que la partie est terminée
puts "La partie est finie"
# Si l'utilisateur est toujours en vie
if player0.life_points > 0
  then puts "BRAVO ! TU AS GAGNE !"
# Si l'utilisateur est mort
  else puts "Loser ! Tu as perdu !"
end

binding.pry