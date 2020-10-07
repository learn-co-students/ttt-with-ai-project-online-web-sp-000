module Players

  class Computer < Player
#
    def move(board)
      input = rand(1..9)
      while board.valid_move?(input) == true
        input = rand(1..9)
      end
      return input.to_s
    end


    # optimal spots
    #     - 3. middle
    #     - 4. corner
    #     - 2. any row or column with 2 of the other team
    #     - 1. any row or column that 2 of your pieces 


  end

end
