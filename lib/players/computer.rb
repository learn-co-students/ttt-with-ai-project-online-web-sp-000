module Players
  class Computer < Player
    def move(board)
      #input = gets
      position = nil
      while 0
        position = pick_position(board, @token)
        break if !board.taken?(position)
      end
      position.to_s
    end

    def pick_position(board, token)
      x_positions, o_positions, me, opponent = [], [], [], []

      board.cells.each_with_index do |cell, i| #figure out what positions are taken
        cell == "X" ? x_positions << i : cell == "O" ? o_positions << i : nil
      end

      #define computer and opponent (potentially other computer)
      token == "X" ? (me = x_positions && opponent = o_positions) : (me = o_positions && opponent = x_positions )

      #pick winning or non-losing position:
      #look at all win combos . if only one value remains, and if it's free, go there. otherwise, skip.
      #look at all lose combos . if only one value remains, and if it's free, go there. otherwise, skip.
      position = strategy(board, me)
      return position if position

      position = strategy(board, opponent)
      return position if position

      position = rand(9) + 1
      puts position #confirmed o chooses random - can't detect win position but can block
      #todo reproduce: open app, enter 1, 1, 2, 6; confirm block with open app, enter 1, 1, 2, 4
      #random might choose win occasionally, but puts shows that random is chosen instead of intentionally choosing win position
      !board.taken?(5) ? 5 : position

    end

    def strategy(board, positions)
      Game::WIN_COMBINATIONS.each do |combo|

        #full array means far from winning; array.length==1 means close to winning
        array = (combo - positions)

        #set position to winning move or non-losing move, in that order
        return (array[0]+1) if (array.length == 1 && !board.taken?(array[0]+1))
      end
      nil
    end

  end
end
