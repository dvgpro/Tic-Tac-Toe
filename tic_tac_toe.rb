class Game
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, empty) }
  end
end
