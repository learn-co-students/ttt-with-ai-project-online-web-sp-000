module Players
  class Computer < Player
    
  def move(board)
    moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    moves.each do |move|
      if board.valid_move?(move)
        return move 
      end 
    end
  end
  
  end
end