require 'pry'

class Game
  
  attr_accessor :human_player, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies = []
    @enemies << Player.new("J1")
    @enemies << Player.new("J2")
    @enemies << Player.new("J3")
    @enemies << Player.new("J4")
  end

  def kill_player(player)
  	@enemies.each do 




    enemies.each do |player|
    # On vérifie que le joueur n'est pas mort
    # Si il est vivant, il peut attaquer
    if player.life_points > 0
    player.attacks(player0)
    # Si il est mort, il ne se passe rien et on teste le joueur suivant


 end

#binding.pry