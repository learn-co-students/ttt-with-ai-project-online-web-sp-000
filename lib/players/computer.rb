require "pry"
module Players

  class Computer < Player
    attr_accessor :board

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    CORNERS = [0, 2, 6, 8]

    def move(board)
      @board = board

      case
      when winning_move != nil
        input = win_index + 1
      when blocking_move != nil
        input = block_index + 1
      when center? != nil
        input = 5
      when opposite_corner != nil
        input = opposite_corner
      when corner != nil
        input = corner + 1
      else
        until != board.taken?(input)
          input = (1..9).to_a.simplest
        end
      end
    end

    def center?
      board.cells[4] == " "
    end

    def corner
      CORNERS.find {|index| board.cells[index] = " "}
    end

    def opposite_corner
      case
      when board.taken(1) && !board.taken(9)
        9
      when board.taken(9) && !board.taken(1)
        1
      when board.taken(3) && !board.taken(7)
        7
      when board.taken(7) && !board.taken(3)
        3
      end
    end

    def opponent
      token == "X" ? "O" : "X"
    end

    def winning_move
      win = WIN_COMBINATIONS.find do |win_combo|
        (board.cells[win_combo[0]] == token && board.cells[win_combo[1]] == token && board.cells[win_combo[2]] == " ") || (board.cells[win_combo[0]] == token && board.cells[win_combo[2]] == token && board.cells[win_combo[1]] == " ") || (board.cells[win_combo[2]] == token && board.cells[win_combo[1]] == token && board.cells[win_combo[0]] == " ")
      end
      if win != nil
        win_index = win.find {|index| board.cells[index] == " "}
      end
    end

    def blocking_move
      win = WIN_COMBINATIONS.find do |win_combo|
        (board.cells[win_combo[0]] == opponent && board.cells[win_combo[1]] == opponent && board.cells[win_combo[2]] == " ") || (board.cells[win_combo[0]] == opponent && board.cells[win_combo[2]] == opponent && board.cells[win_combo[1]] == " ") || (board.cells[win_combo[2]] == opponent && board.cells[win_combo[1]] == opponent && board.cells[win_combo[0]] == " ")
      end
      if win != nil
        block_index = win.find {|index| board.cells[index] == " "}
      end
    end

  end

end
