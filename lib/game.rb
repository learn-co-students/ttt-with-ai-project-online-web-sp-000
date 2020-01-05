class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
		["1", "2", "3"],
		["4", "5", "6"], # Top row
		["7", "8", "9"], # Middle row
		["1", "4", "7"],
		["2", "5", "8"],
		["3", "6", "9"],
		["1", "5", "9"],
		["3", "5", "7"]
	]

	def self.WIN_COMBINATIONS
		WIN_COMBINATIONS
	end

	def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end

	def current_player
	  self.board.turn_count.even? ? self.player_1 : self.player_2 
	end

	def won?
		WIN_COMBINATIONS.find {|win|
			win.all? {|position| 
				self.board.cells[position.to_i - 1] == self.player_1.token
			}
		} || WIN_COMBINATIONS.find {|win|
			win.all? {|position| 
				self.board.cells[position.to_i - 1] == self.player_2.token
			}
		}
		# puts "after out was: #{out.inspect}"
	end

	def draw?
		won? || !full? ? false : true
	end

	def full?
		self.board.cells.none? {|place| place == ' ' || place == '' || place == nil}
	end

	def over?
		won? || full? || draw? ? true : false
	end

	def winner
		won? ? board.cells[won?[0].to_i-1] : nil
	end

	def turn 
		position = current_player.move(@board)
	  if self.board.valid_move?(position)
	  	board.update(position, current_player)
	    position
	  else 
	    turn
	  end
  end

  def play
  	# self.board.display
  	while !over?
  		self.board.display
  		turn
  	end
  	self.board.display
  	puts "Player '#{winner}' WON! Congratultions!!" if won?
  	puts "Cat\'s Game!" if draw?
  end
end