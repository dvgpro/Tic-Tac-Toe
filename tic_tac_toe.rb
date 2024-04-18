class Game
  attr_accessor :board, :current_player_idx
  attr_reader :players

  def initialize(player1_class, player2_class)
    @board = Array.new(3) { Array.new(3) }

    # Stores the current user's index number
    @current_player_idx = 0
    @players = [player1_class, player2_class]
    puts "#{@players[@current_player_idx]} goes first!"
  end

  def play_game
    # Loops upto the size of the array plus 1
    0.upto(10) do
      switch_user
    end
  end

  def game_won; end

  def board_full
    @board.any? do |row|
      row.any? do |e|
        e.respond_to?(:empty?) && e.empty?
      end
    end
  end

  def switch_user
    @current_player_idx = 1 - @current_player_idx
  end

  def display_board
    row_separators = '-- + -- + --'
    @board.map { |row| create_rows(row).concat("\n #{row_separators} \n") }
  end

  def create_rows(row)
    "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  "
  end
end

game1 = Game.new('User', 'Computer')
