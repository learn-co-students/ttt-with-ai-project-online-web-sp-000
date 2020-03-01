require "pry"

module Players
  class Computer < Player

    def move(board)
      array = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]
      counter = 0
      num = array[counter]
      until board.valid_move?(num)
        num = array[counter]
        counter+=1
      end
      num
      # binding.pry
    end
  end
end
