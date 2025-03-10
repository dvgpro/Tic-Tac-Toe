require_relative 'player'

class Human < Player
  # Gets and returns user's input
  def token_location
    puts "Enter number between 1 and 9"

    begin
      location = gets.chomp.to_i
    rescue 
      return token_location
    end

    if !(1..9).include?(location)
      return token_location
    elsif !@game.check_location(location)
      return token_location
    end

    return location
  end
end