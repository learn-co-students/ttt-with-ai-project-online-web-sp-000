module Players
  class Computer < Player 
    
    attr_accessor :board
    
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]
      
    CORNERS = [0, 2, 6, 8]
    
    def move(board)
      @board = board 
      case 
        when winning_move != nil 
          input = winning_move + 1
        when block_move != nil 
          input = block_move + 1 
        when center?
          input = 5
        when opposite_corner != nil && board.taken?(opposite_corner) == false
          input = opposite_corner
        when corner 
          input = corner + 1 
        else 
          until !board.taken?(input)
          input = (1..9).to_a.sample
        end
      end
      input.to_s
    end
    
    def other 
      token == "X" ? "O" : "X"
    end
    
    def winning_move 
      winning_row = WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] && board.cells[combo[1]] && board.cells[combo[2]] == " ") || (board.cells[combo[1]] && board.cells[combo[2]] && board.cells[combo[0]] == " ") || (board.cells[combo[0]] && board.cells[combo[2]] && board.cells[combo[1]] == " ")
      end
      if winning_row != nil
      winning_cell = winning_row.detect {|cell| board.cells[cell] == " "}
      end
    end
    
    def block_move
      block_row = WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == other && board.cells[combo[1]] == other && board.cells[combo[2]] == " ") || (board.cells[combo[1]] == other && board.cells[combo[2]] == other && board.cells[combo[0]] == " ") || (board.cells[combo[0]] == other && board.cells[combo[2]] == other && board.cells[combo[1]] == " ")
      end 
      if block_row != nil
      block_cell = block_row.detect {|cell| board.cells[cell] == " "}
      end
    end
  
    def center?
      board.cells[4] == " "
    end
    
    def opposite_corner
      case 
      when board.taken?(1) && !board.taken?(9)
        9
      when !board.taken?(1) && board.taken?(9)
        1 
      when board.taken?(7) && !board.taken?(3)
        3 
      when !board.taken?(7) && board.taken?(3)
        7 
      else 
        nil
      end
    end
    
    def corners 
      corners = CORNERS.shuffle!
    end 
    
    def corner 
      corners.detect {|corner| board.cells[corner] == " "}
    end
  end
end
