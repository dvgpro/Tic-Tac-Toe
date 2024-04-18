# Game of Tic Tac Toe
class Game
  attr_accessor :board, :current_player_idx
  attr_reader :players

  def initialize(player1_class, player2_class)
    @board = Array.new(3) { Array.new(3) }

    # Stores the current user's index number
    @current_player_idx = 0
    @players = [player1_class.new(self, 'X'), player2_class.new(self, 'O')]
    puts "#{current_user} goes first!"
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

  def current_user
    @players[current_player_idx]
  end

  def switch_user
    1 - @current_player_idx
  end

  def display_board
    row_separators = '-- + -- + --'
    @board.map { |row| create_rows(row).concat("\n #{row_separators} \n") }
  end

  def create_rows(row)
    "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  "
  end
end

# Super class for the player classes
class Player
  attr_reader :marker

  def initialize(game, marker)
    @game = game
    @marker = marker
  end
end

# Creates user that asks for user input after each round
class User < Player
  def marker_position
    loop do
    end
  end
end

Game.new(User, 'Computer')
