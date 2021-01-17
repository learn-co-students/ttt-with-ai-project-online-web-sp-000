module Players

  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      else
        computer_move(board)
      end
    end

    def computer_move(board)
      win_move(board) || block(board) || corner(board) || middle_corner(board)
    end

    def middle_corner(board)
      if !board.taken?("2")
        "2"
      elsif !board.taken?("4")
        "4"
      elsif !board.taken?("6")
        "6"
      elsif !board.taken?("8")
        "8"
      else
        nil
      end
    end

    def corner(board)
      if !board.taken?("1")
        "1"
      elsif !board.taken?("3")
        "3"
      elsif !board.taken?("7")
        "7"
      elsif !board.taken?("9")
        "9"
      else
        nil
      end
    end

    def block(board)
      Game::WIN_COMBINATIONS.detect do |win_combo|
        if board.cells[win_combo[0]] != "#{@token}" && board.cells[win_combo[0]] != " " && board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[2]] == " "
          return "#{win_combo[2] + 1}"
        elsif board.cells[win_combo[0]] != "#{@token}" && board.cells[win_combo[0]] != " " && board.cells[win_combo[0]] == board.cells[win_combo[2]] && board.cells[win_combo[1]] == " "
          return "#{win_combo[1] + 1}"
        elsif board.cells[win_combo[1]] != "#{@token}" && board.cells[win_combo[0]] != " " && board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.cells[win_combo[0]] == " "
          return "#{win_combo[0] + 1}"
        end
      end
    end

    def win_move(board)
      Game::WIN_COMBINATIONS.detect do |win_combo|
        if board.cells[win_combo[0]] == "#{@token}" && board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[2]] == " "
          return "#{win_combo[2] + 1}"
        elsif board.cells[win_combo[0]] == "#{@token}" && board.cells[win_combo[0]] == board.cells[win_combo[2]] && board.cells[win_combo[1]] == " "
          return "#{win_combo[1] + 1}"
        elsif board.cells[win_combo[1]] == "#{@token}" && board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.cells[win_combo[0]] == " "
          return "#{win_combo[0] + 1}"
        end
      end
    end

  end

end
