class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
	  [0,1,2], # Top row
	  [3,4,5], # Middle row
	  [6,7,8],

	  [0,3,6],
	  [1,4,7],
	  [2,5,8],

	  [0,4,8],
	  [2,4,6]
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
		WIN_COMBINATIONS.find do |win|
			# puts "win was: #{win.inspect}"
			win.all? {|position| 
				self.board.cells[position] == self.player_1.token
			} || 
			win.all? {|position| 
				self.board.cells[position]  == self.player_2.token
			}
		end
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
		won? ? board.cells[won?[0]] : nil
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
  	puts "Congratulations #{winner}!" if won?
  	puts "Cat\'s Game!" if draw?
  end
end