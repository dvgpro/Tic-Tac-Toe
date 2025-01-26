require_relative 'player'

class Computer < Player
  # Randomly generate a location when computer class is called
  def token_location
    loop do
      location = Random.new.rand(1..9)
      return location if @game.check_location(location)
    end
  end
end