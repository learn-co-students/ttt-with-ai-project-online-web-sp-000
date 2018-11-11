module Players

  class Computer < Player

    WINNING_SPACES = [
      ["1", "5", "9"],
      ["3", "5", "7"],
      ["4", "5", "6"],
      ["2", "5", "8"],
      ["1", "2", "3"],
      ["7", "8", "9"],
      ["1", "4", "7"],
      ["3", "6", "9"]
    ]

    def move(board)
      corners = ["1", "3", "7", "9"]
      edges = ["2", "4", "6", "8"]
      if board.turn_count <= 1
        turn_1 = corners.detect{|corner| board.valid_move?(corner)}
      elsif board.turn_count == 2 || board.turn_count == 3
        if board.valid_move?("5")
          turn_2 = "5"
        else
          turn_2 = corners.detect{|corner| board.valid_move?(corner)}
        end
      else
        turn_array = WINNING_SPACES.detect do |winning_array|
          winning_array.all?{|cell| board.position(cell) == self.token || board.position(cell) == " "}
        end
        turn_array.detect{|cell| board.valid_move?(cell)}
      end

    end

  end

end
