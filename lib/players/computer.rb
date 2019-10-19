module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 1
        "5"
      elsif board.turn_count > 1 && board.cells[0] == self.token && board.cells[2] == self.token
        "1"
      elsif board.turn_count > 1 && board.cells[0] == self.token && board.cells[6] == self.token
        "3"
      elsif board.turn_count > 1 && board.cells[6] == self.token && board.cells[8] == self.token
        "7"
      elsif board.turn_count > 1 && board.cells[2] == self.token && board.cells[8] == self.token
        "5"
      else board.turn_count == 2
          if !board.taken?("1")
            "1"
          elsif !board.taken?("3")
            "3"
          elsif !board.taken?("7")
            "7"
          else !board.taken?("9")
            "9"
          end
        end
      end
  end
end
