# Creates the game and calls the player obbjects when needed
class TicTacToe
  attr_reader :board, :players, :player_id

  def initialize
    # Creates a 2D grid with 3 arrays of 3 empty values
    @board = Array.new(3) { Array.new(3) }
    @player_id = 0
    
    puts "X goes first!"
  end

  def play_game(player_one, player_two)
    @players = [player_one, player_two]
    
    # For safety reasons, only loops to the amount of spaces on the board
    0.upto(8) do
      place_marker(current_player)

      if win_game
        puts "#{current_player.token} wins!"
        break
      elsif board_full
        puts "It's a draw"
        break
      end
      switch_player
      puts "#{current_player.token}'s turn"
    end
  end

  def win_game
    row_lines || column_lines || diagonal_lines ? true : false
  end

  def row_lines
    # uniq will return one if all values in the array are the same
    @board.any? { |row| row.uniq.size == 1 && !row[0].nil? }
  end

  def column_lines
    # Transposes rows to check the columns without flattening it
    @board.transpose.any? { |column| column.uniq.size == 1 && !column[0].nil? }
  end

  def diagonal_lines
    slash = (0..2).collect { |i| @board[i][i] }
    back_slash = (0..2).collect { |i| @board[i][(i - 2) * -1] }

    if slash.uniq.size == 1 && !slash[0].nil?
      true
    elsif back_slash.uniq.size == 1 && !back_slash[0].nil?
      true
    else
      false
    end
  end

  def board_full
    # Adds the 3 arrays into a single array to better check if all values are filled
    @board.flatten.all?
  end

  def current_player
    @players[@player_id]
  end

  def switch_player
    @player_id = 1 - @player_id
  end

  def check_location(position)
    # Checks if the players position is available or already taken
    @board.flatten[position - 1].nil?
  end

  def place_marker(player)
    idx = player.token_location - 1 # become 7 if user enters 8
    row = idx / 3 # If idx is7, gets 2
    col = idx % 3 # If idx is 7 , gets 1

    @board[row][col] = player.token.to_sym
    puts display_board
  end

  def display_board
    @board.map.with_index { |row, idx| create_rows(row).concat(add_separators(idx)) }
  end

  # Puts divider between each value in a row
  def create_rows(row)
    "  #{row[0] || ' '}  |  #{row[1] || ' '}  |  #{row[2] || ' '}"
  end

  # Makes sure rows are only added after the first and second rows
  def add_separators(idx)
    row_separators = '--- + --- + ---'
    idx == 2 ? '' : "\n #{row_separators} \n"
  end
end





