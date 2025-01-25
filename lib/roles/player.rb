class Player
  attr_reader :game, :token

  def initialize(game, token)
    @game = game
    @token = token
  end
end