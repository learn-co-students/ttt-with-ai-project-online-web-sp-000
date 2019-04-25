module Players
  class Computer < Player

    CENTER = "5"
    CORNERS = ["1","3","7","9"]

    def move(board)
      if !board.taken?(CENTER.to_i)
        CENTER
      elsif check(board).empty? && !corners_taken?(board)
        if one_position(board).empty?
          CORNERS[rand(0..(CORNERS.size - 1))]
        else
          best_position(board) ? best_position(board) : rand(1..9)
        end
      elsif can_win?(board)
        position = can_win_combo(board).find {|index| board.cells[index] == " "}
        position + 1

      elsif should_block?(board)
        position = Array.new
        position =
            combos_to_block(board).map do |combo|
              combo.find do |index|
                board.cells[index] == " "
              end
            end
        position[rand(0..position.size - 1)] + 1
      else
        # binding.pry
        rand(1..9)
      end
    end

    def one_position(board) # where one position in a winning combo is taken
      Game::WIN_COMBINATIONS.find_all do |combo|
        board.cells[combo[0]] == self.token && board.cells[combo[1]] == " " && board.cells[combo[2]] == " " ||
        board.cells[combo[1]] == self.token && board.cells[combo[0]] == " " && board.cells[combo[2]] == " " ||
        board.cells[combo[2]] == self.token && board.cells[combo[0]] == " " && board.cells[combo[1]] == " "
      end.flatten
    end

    def empty_combos(board)
        Game::WIN_COMBINATIONS.find_all do |combo|
          board.cells[combo[0]] == " " && board.cells[combo[1]] == " " && board.cells[combo[2]] == " "
        end.flatten
    end

    def best_position(board)
      position =
        empty_combos(board).find do |a|
          one_position(board).find do |b|
            a == b
          end
        end
      position ? position + 1 : false
    end

    def best_position?(board)
      best_position(board).empty? ?  false : true
    end

    def corners_taken?(board)
      board.cells[0] != " " && board.cells[2] != " " && board.cells[6] != " " && board.cells[8] != " "
    end

    def check(board) #returns arrays that include two of same token and one empty space
      Game::WIN_COMBINATIONS.find_all do |combo|
        if board.cells[combo[0]] == " " || board.cells[combo[1]] == " " || board.cells[combo[2]] == " " #ensures that atleast one cell in combo is blank
          if board.cells[combo[0]] != board.cells[combo[1]] || board.cells[combo[1]] != board.cells[combo[2]] #ensures that not all cells are blank
            board.cells[combo[0]] == board.cells[combo[1]] && board.valid_move?(combo[2] + 1) || #compare each cell in combo with others in combo to check for matching tokens
            board.cells[combo[1]] == board.cells[combo[2]] && board.valid_move?(combo[0] + 1) ||
            board.cells[combo[0]] == board.cells[combo[2]] && board.valid_move?(combo[1] + 1)
          end
        end
      end
    end

    def combos_to_block(board) # returns only checked combos which include enemy token
      self.token == "X" ? enemy_token = "O" : enemy_token = "X"
      check(board).find_all {|combo| board.cells[combo[0]] == enemy_token || board.cells[combo[1]] == enemy_token}
    end

    def can_win_combo(board) # returns array of checked combos which include computer token
      check(board).find_all {|combo| board.cells[combo[0]] == self.token || board.cells[combo[1]] == self.token}.flatten
    end

    def should_block?(board)
      combos_to_block(board).empty? ? false : true
    end

    def can_win?(board)
      !can_win_combo(board).empty?
    end
  end # //////////////END COMPUTER CLASS
end # /////////////END MODULE
