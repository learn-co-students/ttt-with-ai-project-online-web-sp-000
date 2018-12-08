module Players
  class Computer < Player
    def move(board)
      turn_number = @board.turn_count
      if turn_number == 0
        @board.cells[4] = player.token
      end

    end
  end
end
