require 'pry'

module Players
  class Computer < Player
    
    WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

    def move(board)
      if win_check(board) != nil
        win_check(board)
      else available_moves(board)
      end
    end
  
          
    def win_check(board) 
      win_position = Game.win_combo.detect do |win_combo|
        board.cells[win_combo[0]] != ' ' && board.cells[win_combo[0]] == board.cells[win_combo[1]] && 
        board.cells[win_combo[2]] == ' ' ||  board.cells[win_combo[1]] != ' ' && board.cells[win_combo[1]] == 
        board.cells[win_combo[2]] && board.cells[win_combo[0]] == ' ' ||  board.cells[win_combo[2]] != ' ' && 
        board.cells[win_combo[2]] == board.cells[win_combo[0]] && board.cells[win_combo[1]] == ' '
      end
      if win_position != nil
        (win_position.detect{|chamber| board.cells[chamber] == ' '}+1).to_s
      end
    end

    
    def available_moves(board)
      moves = []
      board.cells.each.with_index do |obj, index|
        if obj == ' '
          moves << index
        end
      end
      (moves.sample + 1).to_s
    end
  
  end
end
