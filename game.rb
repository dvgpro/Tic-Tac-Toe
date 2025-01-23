class Game
  attr_reader :game

  def initialize
    @game = TicTacToe.new

    player_one = Human.new(@game, 'X')
    player_two = choose_opponent_control

    @game.play_game
  end

  def get_opponent_control
    puts "Please enter Human or Computer"
    opponent_class = gets.chomps.capitalize()

    if opponent_class == "Human"
      return Human.new(@game, "O")
    elsif opponent_class == "Computer"
      return Computer.new(@game, "O")
    end

    return get_opponent_control
  end  

end

Game.new