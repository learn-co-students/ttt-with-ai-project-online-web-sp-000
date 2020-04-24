module Players

  class Computer < Player

    def move(board)
      valid_moves = []
      counter = 1
      while counter < 10
        if board.valid_move?(counter)
          valid_moves << counter
        end
        counter += 1
      end

      if valid_moves.include?(5)
        board.update(5, self)
        index = 5.to_s
      else
        index = valid_moves.sample
        board.update(index, self)
        index.to_s
      end


    end


  end

end
