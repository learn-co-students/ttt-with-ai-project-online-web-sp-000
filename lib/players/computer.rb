module Players

  class Computer < Player
  
    def move(board)
    minmax(board)
    end


def minmax(board)
      max =  1000
      min = -1000
      counter = []

      if board.valid_move?("5")
        attack = "5"
      else
        sampi_one = [2,4,6,8].sample
        if board.valid_move?(sampi_one)
          attack = sampi_one
        else
          sampi_two = [1,3,7,9].sample
          board.valid_move?(sampi_two)
          attack = sampi_two
        end
      end

    end

    def score
      scores = []
      if draw?
        scores.push(1)
      elsif winner == "X"
        scores.push(5)
      else winner == "O"
        scores.push(-5)
      end
    end

  end
end