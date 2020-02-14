require_relative '../player.rb'

module Players 
  class Human < Player 
    def move(board)
      puts "Please enter the space you would like to take:"
      input = gets.strip
      input 
    end 
  end 
end 