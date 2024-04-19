# Matches number with 2d array position
module Positioning
  def array_position(num)
    case num
    when 1
      [0, 0]
    when 2
      [0, 1]
    when 3
      [0, 2]
    when 4
      [1, 0]
    when 5
      [1, 1]
    when 6
      [1, 2]
    when 7
      [2, 0]
    when 8
      [2, 1]
    when 9
      [2, 2]
    else
      Puts 'Not a position'
    end
  end
end

# Creates single game of tic-tac-toe
class Game
  include Positioning
  attr_reader :board, :current_user_index, :players

  def initialize(player1_class, player2_class)
    # Board array with 9 empty spaces
    @board = Array.new(3) { Array.new(3) }

    # Stores the index for the current user
    @current_player_index = 0
    # Stores player objects
    @players = [player1_class.new(self, 'X'), player2_class.new(self, 'O')]
    puts "#{current_player} goes first!"
  end

  # Loops until game is won or board is full
  def play_game
    0.upto(9) do
      place_token(current_player)

      if game_won
        puts "#{current_player} wins!"
      elsif board_full
        puts "It's a draw"
      end

      switch_player
    end
  end

  # Assign a token to array location
  def place_token(player)
    position = player.select_token_position
    @board[array_position(position)].fill(player.token)
    display_board
  end

  # Checks if any lines are filled with the same token
  def game_won; end

  # Checks if there are any empty spaces left
  def board_full
    check_spot.empty?
  end

  # Deines the current user at the start of each round
  def current_player
    @players[@current_player_index]
  end

  # Switches the user after each round
  def switch_player
    1 - @current_player_index
  end

  # Checks if specific spot is empty before player places token
  def check_spot
    (1..9).any? { |position| @board[array_position(position)].empty? }
  end

  # Displays board
  def display_board; end
end

# Super class that gives the user and computer objects initial variables
class Player
  attr_reader :token

  def initialize(game, token)
    @token = token
    @game = game
  end
end

# Sets current player to user object that gets position on the game board from the user
class User < Player
  def select_token_position
    loop do
      puts 'Enter number from 1 to 9 to place token'
      location = gets.to_i

      return location if @game.check_spot.include?(location)

      puts 'Enter available location!'
    end
  end
end

# Sets current player to computer objects that gets a randomly chossen position
class Computer < Player
  def select_token_position
    loop do
      location = Random.new.rand(1..9)
      return location if @game.check_spot.include?(location)
    end
  end
end

Game.new(User, Computer)
