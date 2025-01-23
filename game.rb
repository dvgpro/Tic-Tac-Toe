class Game
  attr_reader :game

  def initialize
    @game = TicTacToe.new

    player_one = Human.new(@game, 'X')
    player_two = Computer.new(@game, "O")

    @game.play_game
  end
end

Game.new