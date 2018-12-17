module Players
  class Computer < Player
    def move(board)
      # predict(board)

        predict = MinMax.new
        "#{predict.next_move(board)+1}"
    end

    def predict(board)
      puts
      @probability = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
      @probability.each_with_index do |i, index|
        if !board.taken_int?(index)
          @probability[index] = 0
          cell_predict(index, board, index)
        end
      end

      p @probability
      move = nil
      @probability.each_with_index do |i, index| 
        if !!i
          move = index if move == nil
          move = index if i > @probability[move]
        end
      end
      "#{move+1}"
    end

    def cell_predict(cell, board, original_cell)
      new_board = Board.new
      new_board.cells = board.cells.dup
      new_board.cells[cell] = self.token
      
      if new_board.won?
        @probability[original_cell] += 10 * new_board.turn_count
      elsif new_board.draw?
        @probability[original_cell] += 0
        return 0
      else
        
        new_board.cells.each_with_index do |i, index|
          if !new_board.taken_int?(index)

            new_board_enemy = Board.new
            new_board_enemy.cells = new_board.cells.dup
            new_board_enemy.cells[index] = new_board.current_player
            
            if new_board_enemy.won?
              @probability[original_cell] -= 10 * new_board_enemy.turn_count
            else
              new_board_enemy.cells.each_with_index do |i, index|
                cell_predict(index, new_board_enemy, original_cell) if !new_board_enemy.taken_int?(index)
              end
            end
          end
        end
      end
    end
  end
end