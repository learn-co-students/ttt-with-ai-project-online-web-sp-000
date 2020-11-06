module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif !board.taken?(1)
        move = "1"
      elsif !board.taken?(3)
        move = "3"
      elsif !board.taken?(7)
        move = "7"
      elsif !board.taken?(9)
        move = "9"
      elsif board.turn_count >= 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"
      else
        move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
    end
  end
end
