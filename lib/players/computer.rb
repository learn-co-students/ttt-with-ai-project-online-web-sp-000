module Players

  class Computer < Player
    def move(board)
      #board.cells.detect {|cell|input = cell == " "
      input = board.cells.index(" ")
      input +=1
      input.to_s
    end

  end
end
