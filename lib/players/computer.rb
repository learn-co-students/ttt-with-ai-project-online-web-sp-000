module Players
  class Computer < Player

    def move(board)
      board.display
      if board.turn_count == 0
        "5"
      end
      if board.turn_count == 1
        find_empty(board, "5", "1", "3", "7", "9")
      end
      if board.turn_count >= 2
        Game::WIN_COMBINATIONS.each {|combo|
          #Find a winning combination or find a way to stop the other player
          if (board.position(combo[0]) == token && board.position(combo[1]) == token) || (board.position(combo[0]) == token && board.position(combo[2]) == token) || (board.position(combo[1]) == token && board.position(combo[2]) == token)
            if !find_empty(board, combo[0], combo[1], combo[2]).nil?
              return (find_empty(board, combo[0], combo[1], combo[2]) + 1).to_s
            end
          end
        }
        Game::WIN_COMBINATIONS.each {|combo|
          #Find a winning combination or find a way to stop the other player
          if (board.position(combo[0]) != token && board.position(combo[0]) != " " && board.position(combo[1]) != token && board.position(combo[1]) != " ") || (board.position(combo[0]) != token && board.position(combo[0]) != " " && board.position(combo[2]) != token && board.position(combo[2]) != " ") || (board.position(combo[1]) != token && board.position(combo[1]) != " " && board.position(combo[2]) != token && board.position(combo[2]) != " ")
            if !find_empty(board, combo[0], combo[1], combo[2]).nil?
              return (find_empty(board, combo[0], combo[1], combo[2]) + 1).to_s
            end
          end
        }
      end
      return find_empty(board, "5", "1", "3", "7", "9", "2", "4", "6", "8")
    end

    def find_empty(board, *args)
      args.detect {|arg|
        board.position(arg) == " "
      }
    end
  end
end
