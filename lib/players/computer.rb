module Players
  class Computer < Player
    attr_accessor :board
    def available_positions(board)

      valid_moves = []
      board.cells.each_with_index do |cell, index|
        if cell == " "
          valid_moves << "#{index + 1}"
        end
      end
      valid_moves
    end

     def move(board)
       move_to = nil
      if board.turn_count == 1 || !board.taken?(5)
        move_to = "5"
      else
        #verify if there are two of the same tokens next to each other for a winning combination
        board_combo = Game::WIN_COMBINATIONS.detect do|combo|
          combo.count { |x| x == "X"} == 2 || combo.count { |x| x == "X"} == 2
        end
        #if two tokens are next to eachother, move to that space. If not move, then move to a random available position on the board
        if board_combo != nil
          move_to = board_combo.include(" ")
        else
          postion = available_positions(board).sample(1)
          move_to = postion[0]
        end
      end
    end
  end
end
