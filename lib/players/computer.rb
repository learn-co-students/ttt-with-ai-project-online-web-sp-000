module Players
  class Computer < Player

    def valid_move?(board)

      binding.pry
    end


    def move(board)
      valid_moves = []
      input = 1
      board.cells.each do
        if board.valid_move?(input)
          valid_moves << input.to_s
        end
        input+=1
      end
      valid_moves[0]
    end # of move


  end #of class
end # of module
