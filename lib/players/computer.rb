module Players
  class Computer < Player
    # your code here
    attr_accessor :board

    WIN_COMBINATIONS = Game.WIN_COMBINATIONS

    def move(board)
    	@board = board
    	puts "Computer '#{self.token}' move:"
    	puts "pc move:"
    	win
    end

    def win
    	move = fill_triple(self.token) 
    	if !move
    		move = fill_triple(ostile_token)
    	end
    	if !move
    		move = best_position
    		# binding.pry
    	end
    	puts "move:::: #{move}"
    	move
    end

    def fill_triple(token)
    	possible_moves = []
    	occupied_win_combos(token).each_with_index {|combo, i| 
    		if combo.size > 1 
    			move = (WIN_COMBINATIONS[i] - combo)[0]
    			if ! board.taken?(move)
    				possible_moves << move
    			end
    		end
    	}
    	possible_moves.sample
    end

    def occupied_win_combos(token)
    	WIN_COMBINATIONS.map {|combo| 
    		combo.select {|position|
    			true if board.cells[position.to_i - 1] == token
    		}
    	}
    end

    def free_spaces
    	['1','2','3',
    	 '4','5','6',
    	 '7','8','9'].select{|space| !board.taken?(space)}
    end

    def ostile_token
    	self.token == 'X' ? 'O' : 'X'
    end


    def best_position
    	starter_move = "5" 
    	# binding.pry
    	if board.taken?(starter_move)
    		corners = ["1","3","7","9"]
    		while corners.size > 1
    			corner = corners.sample
    			# binding.pry
    			if board.valid_move?(corner)
    				# binding.pry
    				starter_move = corner
    				return starter_move
    			end
    			# puts "corners:::: #{corners - [corner]}"
    			corners = corners - [corner]
    		end
    		# puts "free_spaces::::: #{starter_move}"
    		starter_move = free_spaces.sample
 	   	end
 	   	# puts "best_position:::: END:: #{starter_move}"
 	   	starter_move
    end

  end
end