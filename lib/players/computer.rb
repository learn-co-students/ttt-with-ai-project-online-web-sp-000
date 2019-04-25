module Players
  class Computer < Player


    def move(board)
      #accepts a board and returns the computer's move in the form of a 1-9 string.
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "9"
      elsif board.turn_count == 2
        move = [6, 8].detect{|move| !board.taken?(move)}.to_s
      elsif board.turn_count == 3
        move = [3, 7].detect{|move| !board.taken?(move)}.to_s
      elsif board.turn_count == 4
        move = [2, 4].detect{|move| !board.taken?(move)}.to_s
      elsif board.turn_count == 5
        move = [2, 4].detect{|move| !board.taken?(move)}.to_s
      elsif board.turn_count == 6
        move = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{|move| !board.taken?(move)}.to_s
      elsif board.turn_count == 7
        move = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{|move| !board.taken?(move)}.to_s
      elsif board.turn_count == 8
        move = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{|move| !board.taken?(move)}.to_s
      end
    end
  end
end
