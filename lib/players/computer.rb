module Players
  class Computer < Player
    def move(board)
      @count = 0
      predict(board)
    end

    def predict(board)
      @probability = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
      @probability.each_with_index do |i, index|
        if !board.taken_int?(index)
          @probability[index] = 0
          cell_predict(index, board, index)
        end
      end
      "#{@probability.each_with_index.max[1]+1}"
    end

    def cell_predict(cell, board, original_cell)
      new_board = Board.new
      new_board.cells = board.cells.dup
      new_board.cells[cell] = self.token
      
      if new_board.winner == self.token
        @probability[original_cell] += 1
        return 0
      end
      
      if new_board.draw?
        @probability[original_cell] += 0
        return 0
      end
      
      new_board.cells.each_with_index do |i, index|
        @count += 1
        next if new_board.taken_int?(index)

        new_board_enemy = Board.new
        new_board_enemy.cells = new_board.cells.dup
        new_board_enemy.cells[index] = new_board.current_player
        
        if new_board_enemy.winner != self.token && new_board_enemy.won?
          @probability[original_cell] -= 1
          return 0
        end

        new_board_enemy.cells.each_with_index do |i, index|
          cell_predict(index, new_board_enemy, original_cell) if !new_board_enemy.taken_int?(index)
        end
      end
    end
  end
end