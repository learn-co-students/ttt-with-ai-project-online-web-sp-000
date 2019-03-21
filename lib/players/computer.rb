class Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]]

    PREFFERRED_CELLS = [1, 3, 7, 9, 5, 2, 4, 6, 8]

    def move(board)
      @board = board
      moved = false
      target = 0
      # AI algorithm:
      # If a winning move is available, make it
      if winning_move?(@token)
        target = winning_move?(@token)
        board.update(target.to_s, self)
        moved = true
      end
      # If oppenent is about to win, prevent it
      if winning_move?(@oponent_token)
        target = winning_move?(@oponent_token)
        board.update(target.to_s, self)
        moved = true
      end
      # Preferentially select middle, then corners, then everything else
      unless moved
        target = PREFFERRED_CELLS.find { |cell| board.valid_move?(cell.to_s) }
        board.update(target.to_s, self)
      end
      target.to_s
    end

    def winning_move?(player_token)
      space_location = 0
      return_value = false
      # Check for any WIN_COMBINATIONS with 2 of three spaces filled and one available
      WIN_COMBINATIONS.each do |combo|
        token_count = 0
        space_count = 0
        combo.each do |cell|
          token_count += 1 if @board.cells[cell] == player_token
          if @board.cells[cell] == " "
            space_count += 1
            space_location = cell + 1
          end
        end
        return_value = space_location if token_count == 2 && space_count == 1
      end
      return_value
    end
  end
end
