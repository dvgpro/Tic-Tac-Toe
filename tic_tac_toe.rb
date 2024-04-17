class Game
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def play_game
    loop do
    end
  end

  def display_board
    row_separators = '-- + -- + --'
    @board.map { |row| create_rows(row).concat("\n #{row_separators} \n") }
  end

  def create_rows(row)
    "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  "
  end
end

game1 = Game.new
puts game1.display_board
