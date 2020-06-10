module Players
  class Computer < Player
    
    def move(board)
      winning_combo = Game::WIN_COMBINATIONS.detect do |combo|
        combo.count {|position| board.cells[position] == self.token } == 2 &&
        combo.count {|position| board.cells[position] == " " } == 1
      end

      if winning_combo
        winning_position = winning_combo.find {|position| position != self.token }
        if board.cells[winning_position] == " "
          return (winning_position + 1).to_s
        end
      end

      defend_combo = Game::WIN_COMBINATIONS.detect do |combo|
        combo.count do |position| 
          board.cells[position] != self.token && board.cells[position] != " "
        end == 2 && combo.count {|position| board.cells[position] == " " } == 1
      end

      if defend_combo
        winning_position = defend_combo.find {|position| board.cells[position] == " "}
        return (winning_position + 1).to_s
      end

      potential_combo = Game::WIN_COMBINATIONS.detect do |combo|
        combo.count {|position| board.cells[position] == self.token } == 1 &&
        combo.count {|position| board.cells[position] == " " } == 2
      end

      if potential_combo
        return (potential_combo.find {|position| board.cells[position] == " " } + 1).to_s
      end

      (1..9).to_a.find {|position| board.valid_move?(position)}.to_s

    end
  end
end