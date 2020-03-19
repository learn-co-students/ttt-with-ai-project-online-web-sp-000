#require '../game'
module Players
  class Computer < Player
    def move(board)
      #input = gets
      position = 0
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

      #define computer and opponent
      token == "X" ? (me = x_positions && opponent = o_positions) : (me = o_positions && opponent = x_positions )

      #pick winning or non-losing position:
      #look at all win combos . if only one value remains, and if it's free, go there. otherwise, skip.
      #look at all lose combos . if only one value remains, and if it's free, go there. otherwise, skip.
      Game::WIN_COMBINATIONS.each do |combo|
        win_array = (combo - me) #full array means far from winning; array.length==1 means close to winning
        do_not_lose_array = (combo - opponent)

        return (win_array[0]+1) if (win_array.length == 1 && !board.taken?(win_array[0]+1)) #set position to winning move - prioritizes winning
        return (do_not_lose_array[0]+1) if (do_not_lose_array.length == 1 && !board.taken?(do_not_lose_array[0]+1)) #set position to prevent loss

      end

      !board.taken?(5) ? 5 : (rand(9) + 1)

    end

  end
end
