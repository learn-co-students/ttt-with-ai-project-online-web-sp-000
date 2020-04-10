class Players
  class Computer < Player

    def move(board)
      #valid positions are those positions in the board that do not include "X" or "O"
      #create an array of all valid positions & then sample that
      valid_positions = []
      board.cells.each_with_index do |cell, index|
        if cell == " " || cell == ""
          valid_positions << index
        end
      end

      valid_positions.sample.to_s
    end

  end
end
