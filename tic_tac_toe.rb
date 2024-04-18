class Game
  attr_accessor :board, :current_player_idx
  attr_reader :players

  def initialize(player1_class, player2_class)
    @board = Array.new(3) { Array.new(3) }

    # Stores the current user's index number
    @current_player_idx = 0
    @players = Array.new(player1_class, player2_class)
    puts "#{@players[@current_player_idx]} goes first!"
  end

  def play_game
    0.upto(10) do
    end
  end

  def game_won; end

  def board_full; end

  def switch_user; end

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
