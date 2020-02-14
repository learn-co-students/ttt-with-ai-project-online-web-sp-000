require_relative '../player.rb'

module Players 
  class Computer < Player 
    def move(board)
      if !board.taken?(1)
        "1" 
      elsif !board.taken?(3)
        "3"
      elsif !board.taken?(7)
        "7" 
      elsif board.taken?(1) && board.taken?(7) && !board.taken?(4)
        "4"
      elsif !board.taken?(9)
        "9"
      elsif !board.taken?(5)
        "5"
      elsif board.taken?(3) && board.taken?(9) && !board.taken?(6)
        "6"
      elsif board.taken?(7) && board.taken?(9) && !board.taken?(8)
        "8"
      elsif board.taken?(1) && board.taken?(3) && !board.taken?(2)
        "2"
      elsif board.taken?(1) && board.taken?(9) && !board.taken?(5)
        "5" 
      elsif board.taken?(3) && board.taken?(7) && !board.taken?(5)
        "5"
      elsif !board.taken?(2)
        "2"
      elsif !board.taken?(4)
        "4"
      elsif !board.taken?(6)
        "6"
      elsif !board.taken?(8)
        "8" 
      end 
    end
  end 
end 
