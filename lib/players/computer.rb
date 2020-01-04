module Players
  class Computer < Player
    # your code here
    attr_accessor :board

    WIN_COMBINATIONS = Game.WIN_COMBINATIONS

    def move(board)
    	@board = board
    	puts "Computer '#{self.token}' move:"
    	ai
    end

    def ai
    	if board.turn_count < 4
    		best_start
    	else
    		win
    	end
    end

    def win
    	#win body
    	best_defence
    end

    def best_defence
    	puts ostile_win_combos.inspect
    end

    def best_attack

    end

    def ostile_win_combos
    	WIN_COMBINATIONS.map {|combo| 
    		combo.select {|position| 
    			# binding.pry 
    			ostile?(position)
    		}
    	}
    end

    def ostile?(position)
    	if board.cells[position] != self.token  &&
    	   board.cells[position] != ' ' &&
    	   board.cells[position] != ''
    		true
    	end
    end


    def best_start
    	starter_move = '5' 
    	if board.taken?(starter_move)
    		corners = ['1','3','7','9']
    		while corners.size > 1
    			corner = corners.sample
    			if board.valid_move?(corner)
    				starter_move = corner
    				break
    			end
    			corners = corners - [corner]
    		end
    	end
    	starter_move
    end

  end
end