module Players
  class Computer < Player
    
    def initialize(token)
      super
      @default_move = 0
    end
    
    def move(board)
      puts "Computer #{token}'s turn"
      # sleep(2)
      if token == "X" && !(x_ai(board) == nil)
        x_ai(board)
      elsif token == "O" && !(o_ai(board) == nil )
        o_ai(board)
      else
        @default_move += 1
        @default_move.to_s
      end
    end
    
    def x_ai(board)
      if board.turn_count == 0
        "1"
      elsif board.turn_count == 2
        if board.taken?("5")
          "9"
        elsif !board.taken?("2") && !board.taken?("3")
          "3"
        else
          "7"
        end
      elsif board.turn_count == 4
        if !board.taken?("2") && board.position("3") == "X"
          "2"
        elsif !board.taken?("4") && board.position("7") == "X"
          "4"
        elsif board.taken?("9")
          block(board) || "7"
        elsif board.position("3") == "O" || board.position("7") == "O"
          "9"
        elsif !board.taken?("5")
          "5"
        else
          "8"
        end
      else
        win(board) || x_endgame(board)
        
      end
    end
    
    def x_endgame(board)
      end_pos = ["3", "7", "2", "4", "6", "8"]
      end_pos.detect { |position| !board.taken?(position) }
    end
    
    def o_ai(board)
      if board.turn_count == 1
        if !board.taken?("5")
          "5"
        else
        "1"
        end
      elsif board.turn_count == 3
        block(board) || o_clusterblocker(board) || (
        if ["1", "3", "7", "9"].select { |position| board.position(position) == "X" }.count == 2
          "2"
        elsif ["1", "3", "7", "9"].select { |position| board.position(position) == "X" }.count == 1 &&
          ["2", "4", "6", "8"].select { |position| board.position(position) == "X" }.count == 1
          o_endgame(board)
        else
          ["1", "3", "7", "9"].detect { |position| !board.taken?(position) }
        end
        )
      else
        win(board) || block(board) || o_clusterblocker(board) || o_endgame(board)
      end
    end
    
    def o_clusterblocker(board)
      x_pos = ["2", "4", "6", "8"].find_all { |position| board.position(position) == "X" }
      if !board.taken?("3") && x_pos == ["2", "6"]
        "3"
      elsif !board.taken?("7") && x_pos == ["4", "8"]
        "7"
      elsif !board.taken?("9") && x_pos == ["6", "8"]
        "9"
      end
    end
      
    
    def o_endgame(board)
      if board.position("5") == "O" && 
      ["4", "6"].select { |position| board.position(position) == " " }.count == 2
        "4"
      elsif board.position("5") == "O" && 
      ["8", "2"].select { |position| board.position(position) == " " }.count == 2
        "2"
      else
        ["1", "3", "7", "9", "2", "4", "6", "8"].detect { |position| !board.taken?(position) }
      end
    end
    
    def win(board)
      combination = Game::WIN_COMBINATIONS.detect do |combination|
        combination.select { |position| board.cells[position] == token }.count == 2 &&
        combination.any? { |position| board.cells[position] == " " }
      end
      if combination != nil
        position = combination.detect { |position| board.cells[position] == " " }
        position += 1
        position.to_s
      end
    end
    
    def block(board)
      combination = Game::WIN_COMBINATIONS.detect do |combination|
        combination.select { |position| 
          board.cells[position] != token &&
          board.cells[position] != " " 
        }.count == 2 &&
        combination.any? { |position| board.cells[position] == " " }
      end
      if combination != nil
        position = combination.detect { |position| board.cells[position] == " " }
        position += 1
        position.to_s
      end
    end
    
  end
end