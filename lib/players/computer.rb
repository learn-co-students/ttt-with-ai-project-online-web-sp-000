module Players 
  class Computer < Player
    attr_reader :board
    
    def move(board)
      @board = board
      puts "Where would you like your move to be, Computer Scum?"
      suggested_move
    end
    
    def check
      # The below comments are just for testing!
      # @board.cells = [' ', ' ', ' ', 'O', ' ', 'X', ' ', ' ', 'X']
      # @token = 'O'
      opponent = @board.cells.map{|cell| 
        if cell == " "
          "open"
        elsif cell == @token
          false
        else 
          true
        end
      }
    end 
    
    def risks
      
      combos = Game::WIN_COMBINATIONS
      risky_combos = [] 
      
      combos.each do |combo|
        if check[combo[1]] == true && check[combo[2]] == true && check[combo[0]] == "open"
          risky_combos << combo
        elsif check[combo[0]] == true && check[combo[1]] == true && check[combo[2]] == "open"
          risky_combos << combo
        elsif check[combo[0]] == true && check[combo[2]] == true && check[combo[1]] == "open"
          risky_combos << combo
        end 
      end 
      risky_combos
    end 
    
    def suggested_move 
      move = rand(1..9).to_s
      if risks.length
        risks.each do |combo|
          if check[combo[0]] == "open"
            move = combo[0]+1
          elsif check[combo[1]] == "open"
            move = combo[1]+1
          else 
            move = combo[2]+1
          end
        end 
      else 
        move = rand(1..9).to_s
      end 
      move.to_s
    end
    
  end

end 

