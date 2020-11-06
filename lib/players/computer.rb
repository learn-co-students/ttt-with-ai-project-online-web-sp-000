require 'pry'
module Players
  class Computer < Player
  #  binding.pry
  #  @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1 || board.turn_count == 2
        move = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      elsif board.turn_count == 3 &&
        board.position(1) == board.position(9) ||
        board.position(3) == board.position(7)
        move = "2"
      elsif board.turn_count >= 4
      move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken?(i)}.to_s
    end


    end
  end
end
