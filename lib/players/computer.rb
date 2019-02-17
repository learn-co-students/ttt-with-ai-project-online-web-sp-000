module Players
  class Computer < Player
    attr_reader :input

    def move(board)
        board.display
        @input = rand(1..9).to_s
    end

    # def block
    #   if self.token == "X"
    #     if board.cells[0] == "O" && board.cells[2] == "O" && board.cells[1] == " "
    #       @input == "2"
    #     end
    #   end
    # end

  end
end
