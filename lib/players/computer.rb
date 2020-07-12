require_relative '../player.rb'

module Players
  class Computer < Player

  	def move(board)
  	  @board = board
  	  computer_input = rand(1..9).to_s
  	  #binding.pry
  	end
  end
end