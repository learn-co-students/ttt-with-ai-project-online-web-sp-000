module Players

  class Computer < Player

    def move(board)
      corners = ["1", "3", "7", "9"]
      if board.turn_count <= 1
        turn_1 = corners.detect{|corner| board.valid_move?(corner)}
      elsif board.turn_count == 2 || board.turn_count == 3
        if board.valid_move?("5")
          turn_2 = "5"
        else
          turn_2 = corners.detect{|corner| board.valid_move?(corner)}
        end
      else
        output = rand(1..9)
        if board.valid_move?(output)
          output
        else
          move(board)
        end
      end
    end # end of method

  end

end
