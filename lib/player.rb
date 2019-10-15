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

# Déclaration de la class HumanPlayer qui hérite de la class Player
class HumanPlayer < Player

attr_accessor :weapon_level # On ajoute une variable d'instance weapon_level

  # On modifie la méthode initialize uniquement pour le HumanPlayer
  def initialize(player_name) # On prend toujours uniquement l'objet player_name en entrée
    super(player_name) # On fait appel au initialize de la class Player pour l'objet player_name   
    @life_points = 100 # Mais on attribue 100 pts de vie à la variable d'instance @life_points au HumanPlayer
    @weapon_level = 1 # Et on attribue la valeur 1 à la variable d'instance weapon_level
  end

  # On modifie également la méthode show_state affiche l'état de l'objet Player
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  # On met en lien la variable d'instance weapon_level avec la méthode compute_damage
  def compute_damage
    rand(1..6) * @weapon_level
  end

  # La méthode search_weapon permet au joueur de chercher une arme plus puissante
  def search_weapon
    # On lance un dé dont le résultat (compris entre 1 et 6) est égal au niveau de la nouvelle arme trouvée
    # On stock le résultat dans une variable new_weapon_level
    new_weapon_level = rand(1..6)
    # On annonce le résultat de la recherche à l'utilisateur
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    # On compare le niveau de cette nouvelle arme avec celle qu'il possède déjà
    # Si l'arme trouvée est d'un niveau strictement supérieur, il la garde
    if new_weapon_level > @weapon_level then
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    # Si l'arme trouvée est égale ou moins bien que son arme actuelle, on ne changes rien
    elsif new_weapon_level <= @weapon_level then
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # La méthode search_health_pack permet au joueur de partir à la recherche d'un pack de pts de vie afin de faire remonter son niveau de vie
  def search_health_pack
    # On lance un dé dont le résultat est compris entre 1 et 6
    # On stock le résultat dans une variable health_dice
    health_dice = rand(1..6)
    # En fonction du résultat, plusieurs possibilités :
    case health_dice
      # Si health_dice = 1, le joueur n'a rien trouvé
      when 1 then
        puts "Tu n'as rien trouvé..."
      # Si health_dice est compris entre 2 (inclus) et 5 (inclus), le joueur a trouvé un pack de 50 points de vie.
      # On augmente sa vie de 50 points dans la limite de 100 points.
      when 2, 3, 4, 5 then
        if @life_points <= 50
          then @life_points + 50
        else @life_points = 100
        end
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      # Si health_dice = 6, le joueur a trouvé un pack de 80 points de vie.
      # On augmente sa vie de 80 points dans la limite de 100 points.
        when 6 then
        if @life_points <= 20
          then @life_points + 80
        else @life_points = 100
        end
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end

# binding.pry
# puts 'end of file'