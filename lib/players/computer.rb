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
      if board.turn_count <= 1
        turn_1 = corners.detect{|corner| board.valid_move?(corner)}
      elsif board.turn_count == 2 || board.turn_count == 3
        if board.valid_move?("5")
          turn_2 = "5"
        else
          turn_2 = corners.detect{|corner| board.valid_move?(corner)}
        end
      else
        this_turn = WINNING_SPACES.detect do |winning_array|
          winning_array.detect{|cell| board.valid_move?(cell)}
        end
        if this_turn.class == Array
          this_turn.detect{|cell| board.valid_move?(cell)}
        else
          board.cells.shuffle.detect{|cell| board.valid_move?(cell)}
        end
      end
    end

  end

end
