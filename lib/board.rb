class Board
	attr_accessor :cells

	def initialize
		self.reset!
	end

	def reset!
		@cells = (1..9).map {' '}
	end

	def display
		puts ""
		puts ""
		puts '~~~~~~~~~~~'
		puts ":::: #{turn_count()} ::::"
		puts ""
		puts '-----------'
	  puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
	  puts '-----------'
	  puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
	  puts '-----------'
	  puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	  puts '-----------'
	  puts ""
	end

	def position(input)
		self.cells[input.to_i - 1]
	end

	def full?
		@cells.none? {|place| place == ' ' || place == '' || place == nil}
	end

	def turn_count
	  counter = 0
	  @cells.each do |place|
	    if place == 'X' || place == 'O'
	      counter += 1 
	    end
	  end
	  counter
	end

	def taken?(position)
		cells[position.to_i - 1] != " "
	end

	def valid_move?(position)
	  (!taken?(position)) && position.to_i.between?(1, 9)
	end

	def update(index, player)
		@cells[index.to_i - 1] = player.token
	end
end