require_relative '../player.rb'

module Players
  class Human < Player

  	def move(board)
  	  @board = board
  	  puts "Please enter 1-9:"
      @input = gets

  	end
  end
end