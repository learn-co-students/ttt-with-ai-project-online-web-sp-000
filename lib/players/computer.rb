require "pry"

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

    def move (board)
      if board.turn_count == 0
        ["1", "3", "5", "7", "9"].sample
      elsif board.turn_count == 1
        if board.taken?("5")
          ["1", "3", "7", "9"].sample
        else
          "5"
        end
      else
        winner = can_win_next_turn?(board.cells)
        other_player_winner = other_player_can_win_next_turn?(board.cells)
        if winner
          winner
        elsif other_player_winner
          other_player_winner
        elsif !board.taken?("1")
          "1"
        elsif !board.taken?("3")
          "3"
        elsif !board.taken?("7")
          "7"
        elsif !board.taken?("9")
          "9"
        elsif !board.taken?("5")
          "5"
        elsif !board.taken?("2")
          "2"
        elsif !board.taken?("4")
          "4"
        elsif !board.taken?("6")
          "6"
        else
          "8"
        end
      end
    end

    def can_win_next_turn? (cells)
      counter = 0
      original_cells = []
      cells.each {|cell| original_cells << cell}
      while counter < 9
        if original_cells[counter] == " "
          original_cells[counter] = self.token
          if won?(original_cells)
            return (counter + 1).to_s
          else
            counter += 1
          end
          original_cells = []
          cells.each {|cell| original_cells << cell}
        else
          counter += 1
        end
      end
      false
    end

    def other_player_can_win_next_turn? (cells)
      other_player_token = ""
      counter = 0
      if self.token == "X"
        other_player_token = "O"
      else
        other_player_token = "X"
      end
      original_cells = []
      cells.each {|cell| original_cells << cell}
      while counter < 9
        if original_cells[counter] == " "
          original_cells[counter] = other_player_token
          if won?(original_cells)
            return (counter + 1).to_s
          else
            counter += 1
          end
          original_cells = []
          cells.each {|cell| original_cells << cell}
        else
          counter += 1
        end
      end
      false
    end

    def won? (cells)
      WIN_COMBINATIONS.each do |combo|
        if (cells[combo[0]] == "X" && cells[combo[1]] == "X" && cells[combo[2]] == "X") || (cells[combo[0]] == "O" && cells[combo[1]] == "O" && cells[combo[2]] == "O")
          return true
        end
      end
      false
    end

  end
end
