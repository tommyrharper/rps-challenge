require_relative 'player'
require_relative 'computer'

class Game

  attr_reader :result, :player, :computer

  RULES = { rock: :scissors,
    paper: :rock,
    scissors: :paper }

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def set_result
    wins? ? (@result = :win) : (@result = :lose)
    (@result = :draw) if draws?
  end

  def self.create(player, computer)
    @game = Game.new(player, computer)
  end

  def self.instance
    @game
  end

  def wins?
    RULES[@player.move] == @computer.move
  end

  def draws?
    @player.move == @computer.move
  end

end
