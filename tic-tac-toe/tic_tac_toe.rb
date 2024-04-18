# Creates single game of tic-tac-toe
class Game
    attr_reader :board :current_user_index :players
  def initialize(player1_class, player2_class)
    # Board array with 9 empty spaces
    @board = Array.new(9)

    # Stores the index for the current user
    @current_user_index = 0
    # Stores player objects
    @players = [player1_class.new(self, 'X'), player2_class.new(self, 'O')]
    puts "#{players[current_user_index]} goes first!"
  end

  # Loops until game is won or board is full
  def play_game; end

  # Checks if any lines are filled with the same token
  def game_won; end

  # Checks if there are any empty spaces left
  def board_full; end

  # Deines the current user at the start of each round
  def current_user; end

  # Switches the user after each round
  def switch_users; end

  # Checks if specific spot is empty before player places token
  def check_spot; end

  # Displays board
  def display_board; end
end

Game.new('User', 'Computer')
