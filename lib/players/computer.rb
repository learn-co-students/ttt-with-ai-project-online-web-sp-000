module Players
  class Computer < Player
    # your code here
    attr_accessor :board

    WIN_COMBINATIONS = Game.WIN_COMBINATIONS

    def move(board)
    	@board = board
    	puts "Computer '#{self.token}' move:"
    	puts "pc move: #{win + 1}"
    	"#{win + 1}"
    end

    def win
    	move = fill_triple(self.token) || fill_triple(ostile_token)
    	binding.pry
    	if !move
    		move = best_position
    	end
    	move
    end

    def fill_triple(token)
    	possible_moves = []
    	occupied_win_combos(token).each_with_index {|combo, i| 
    		if combo.size > 1 
    			possible_moves << WIN_COMBINATIONS[i] - combo
    		end
    	}
    	possible_moves.size == 0 ? false : possible_moves.sample[0]
    end

    def occupied_win_combos(token)
    	WIN_COMBINATIONS.map {|combo| 
    		combo.select {|position|
    			true if board.cells[position] == token
    		}
    	}
    end

    def ostile_token
    	self.token == 'X' ? 'O' : 'X'
    end


    def best_position
    	starter_move = 4 
    	if board.taken?(starter_move)
    		corners = [0,2,6,8]
    		while corners.size > 1
    			corner = corners.sample
    			if board.valid_move?(corner + 1)
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