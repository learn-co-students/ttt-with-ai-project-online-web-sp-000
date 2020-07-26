module Players
  class Computer < Player

    attr_accessor :other_player

    WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    def move(board)
      move = nil
      winner = false
      trial_order = [6, 8, 4, 2, 5, 7, 9, 3, 1] 
      (1..9).each do |index|
        trial_board = Board.new(board.cells.map(&:clone))
        if trial_board.valid_move?(index)
          move = index
          trial_board.update(index, self)
          if won?(trial_board)
            winner = true
            break
          end
        end
      end
      if winner == false
        trial_order.each do |index|
          trial_board = Board.new(board.cells.map(&:clone))
          if trial_board.valid_move?(index)
            move = index
            trial_board.update(index, self.other_player)
            if won?(trial_board)
              break
            end
          end
      end
    end
      puts "Computer moves: #{move}"
      move
    end

    def won?(board)
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return true
        end
      end
      return false
    end
  end
end