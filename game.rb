require_relative 'lib/tic_tac_toe'
require_relative 'lib/roles/human'
require_relative 'lib/roles/computer'

class Game
  attr_reader :game

  def initialize
    load_credits
    @game = TicTacToe.new

    player_one = Human.new(@game, 'X')
    player_two = get_opponent_control

    @game.play_game(player_one, player_two)
  end

  def get_opponent_control
    puts "Please enter Human or Computer"
    opponent_class = gets.chomp.capitalize()

    if opponent_class == "Human"
      return Human.new(@game, "O")
    elsif opponent_class == "Computer"
      return Computer.new(@game, "O")
    end

    return get_opponent_control
  end  

  def load_credits
    begin
      File.foreach('credits.txt') {|line| puts line}
    rescue
        puts "File can't be found"
    end
    
  end

end

Game.new