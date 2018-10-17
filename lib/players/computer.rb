module Players
  class Computer < Player
    
    WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]
  
    def move(board)
      if board.cells[4] == " "
        return 5.to_s
        elsif board.cells[0] == " "
        return 1.to_s
        elsif board.cells[2] == " "
        return 3.to_s
        elsif board.cells[8] == " "
        return 9.to_s
        elsif board.cells[6] == " "
        return 7.to_s
        else
        board.cells.each_with_index do |pos, index|
          return (index + 1).to_s  if pos == " "
        end
      end
    end
  end
end