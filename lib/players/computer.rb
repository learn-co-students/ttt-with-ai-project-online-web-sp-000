
module Players
  class Computer < Player
    def move(board)
      move = nil #start with an empty

      if !board.taken?(1) #first turn automatically go for middle
        move = "1"
      elsif !board.taken?(2) #first turn automatically go for middle
        move = "2"
      elsif !board.taken?(3) #first turn automatically go for middle
        move = "3"
      elsif !board.taken?(4) #first turn automatically go for middle
        move = "4"
      elsif !board.taken?(5) #first turn automatically go for middle
        move = "5"
      elsif !board.taken?(6) #first turn automatically go for middle
        move = "6"
      elsif !board.taken?(7) #first turn automatically go for middle
        move = "7"
      elsif !board.taken?(8) #first turn automatically go for middle
        move = "8"
      elsif !board.taken?(9) #first turn automatically go for middle
        move = "9"
      end
      move
    end
  end
end
