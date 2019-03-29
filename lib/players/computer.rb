module Players
  class Computer < Player

    CENTER = "5"
    CORNERS = ["1","3","7","9"]

    def move(board)
      # board.cells = ["O", "X", "O", "O", "X", " ", "X", "O", "X"]
      # binding.pry
      if check(board).empty? && !board.taken?(CENTER.to_i)
        CENTER
      elsif check(board).empty? && board.taken?(CENTER.to_i) && !corners_taken?(board)
        CORNERS[rand(1..CORNERS.size)]
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
            # binding.pry
        position[rand(0..position.size - 1)] + 1

      else
        # binding.pry
        rand(1..9)
      end
      # binding.pry
    end

    def corners_taken?(board)
      board.cells[0] != " " || board.cells[2] != " " || board.cells[6] != " " ||board.cells[8] != " "
    end

    def check(board) #returns arrays that include two of same token and one empty space
      Game::WIN_COMBINATIONS.find_all do |combo|
        # binding.pry
        if board.cells[combo[0]] == " " || board.cells[combo[1]] == " " || board.cells[combo[2]] == " "
          if board.cells[combo[0]] != board.cells[combo[1]] || board.cells[combo[1]] != board.cells[combo[2]]
            board.cells[combo[0]] == board.cells[combo[1]] && board.valid_move?(combo[2] + 1) ||
            board.cells[combo[1]] == board.cells[combo[2]] && board.valid_move?(combo[0] + 1) ||
            board.cells[combo[0]] == board.cells[combo[2]] && board.valid_move?(combo[1] + 1)
          end
        end
      end
    end

    def combos_to_block(board) # returns only checked combos which include enemy token
      self.token == "X" ? enemy_token = "O" : enemy_token = "X"
      check(board).find_all {|combo| board.cells[combo[0]] == enemy_token || board.cells[combo[1]] == enemy_token}
      # binding.pry
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
    #
    # def decide_position(board)
    #   if should_win?(board)
    #     can_win_combo(board).find {|index| board.cells[index] == " "}
    #   # elsif should_block(board)
    #   #   combos_to_block(board)
    #   end
    # end

  end
end
