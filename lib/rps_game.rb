require_relative './player.rb'

class RPSGame
  attr_reader :player_1, :player_2
  def initialize(player_1, player_2 = Player.new("RPS Computer"))
    @player_1 = player_1
    @player_2 = player_2
  end

  def computer_move
    ["Rock", "Paper", "Scissors"].sample
  end

  def player_1_move
    player_1_move = @player_1.move.downcase
  end

  def player_2_move
    player_2_move = @player_2.move = computer_move.downcase
  end
  
  def play_rps
    case [player_1_move, player_2_move]
      when ["rock", "scissors"], ["paper", "rock"], ["scissors", "paper"]
        "You win"
      when ["scissors", "rock"], ["rock", "paper"], ["paper", "scissors"]
        "The RPS Computer wins"
      else
        "It's a draw!"
    end
  end
end
