require "pry"

class Board
	attr_accessor :cells

	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def reset!
		self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		puts " #{@cells[0]} | #{@cells[01]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(input)
		input_to_index = input.to_i - 1
		@cells[input_to_index]
	end

	def full?
		!@cells.include?(" ")
	end

	def turn_count
		# @cells.collect { |pos| pos == "X" || pos == "O"}
		@cells.count { |index| index == "X" || index == "O"}
	end

	def taken?(pos)
		index = pos.to_i - 1
		@cells[index] == "X" || @cells[index] == "O"
	end

	def valid_move?(pos)
		index = pos.to_i - 1
		!taken?(pos) && pos.to_i > 0 
	end

	def update(pos, player)
		if valid_move?(pos)
			index = pos.to_i - 1
			@cells[index] = player.token
		end
	end
end