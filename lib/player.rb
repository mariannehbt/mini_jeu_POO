require 'pry'

# Déclaration de la class Player (en CamelCase)
class Player

  # attr_accessor permet de donner accès à une variable d'instance en lecture et en écriture
  attr_accessor :name, :life_points

  # La méthode initialize permet d'éxécuter du code à la création d'une instance
  def initialize(player_name) # On prend en entrée un seul objet player_name (en snake_case) car tous les joueurs commencent avec 10 pts de vie
    @name = player_name.to_s # L'objet player_name est de .class String
    @life_points = 10 # On attribue les 10 pts de vie à la variable d'instance @life_points
  end

  # La méthode show_state affiche l'état de l'objet Player
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  # La méthode gets_damage permet de contrôler le niveau de vie d'un joueur
  def gets_damage(suffered_damage) # On prend en entrée un objet suffered_damage (= le nombre de dommages subits)
  	# On soustraie le nombre de dommages subits au nombre de pts de vie
    @life_points = @life_points - suffered_damage.to_i # L'objet suffered_damage est de .class Integer
    if @life_points <= 0 # On vérifie si la variable d'instance @life_points est inférieure ou égale à 0
      # Si c'est le cas, on indique à l'utilisateur que le joueur est mort
      then puts "Le joueur #{@name} a été tué !" # On utilise #{} qui permet d'insérer une variable dans une string
      @life_points = 0
    end
  end

   # La méthode compute_damage permet de calculer les dommages que le joueur attaquant va faire subir au joueur attaqué
  def compute_damage
    return rand(1..6) # Les dommages sont aléatoires car égaux au résultat d'un lancé de dé (= un chiffre au hasard entre 1 et 6)
  end

  # La méthode attacks permet de faire qu'un joueur en attaque un autre
  def attacks(attacked_player) # On prend en entrée un objet Player qui est le joueur subissant l'attaque
    puts "#{@name} attaque #{attacked_player.name}" # On annonce quel joueur attaque et quel joueur est attaqué
    damages = compute_damage # On fait appel à la méthode compute_damage et on stock son résultat dans une variable damages
    puts "#{@name} inflige #{damages} points de dommages à #{attacked_player.name}"
    attacked_player.gets_damage(damages) # On fais subir les dommages au joueur attqué en faisant appel à la méthode gets_damage et en utilisant la variable damages
  end

end

# binding.pry
# puts 'end of file'