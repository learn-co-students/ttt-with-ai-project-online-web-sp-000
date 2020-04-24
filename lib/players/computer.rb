module Players

  class Computer < Player

    def move(board)
      index = nil
      valid_moves = []
      counter = 1
      while counter < 10
        if board.valid_move?(counter)
          valid_moves << counter
        end
        counter += 1
      end
#take the middle if available
      if valid_moves.include?(5)
        board.update(5, self)
#take the corner if going second
      elsif board.turn_count == 1
        index = [1,3,7,9].sample
        board.update(index, self)
#take a side square if 2 corners are taken first
      elsif board.turn_count == 3
        if (board.cells[0] == board.cells[8] || board.cells[2] == board.cells[6])
          index = [2,4,6,8].sample
          board.update(index,self)
#otherwise take a corner
        else

          board.update(index,self)
        end
#do something random for now - I think I have to iterate through win combinations to do it correctly
      else
          index = valid_moves.sample
          board.update(index,self)
      end
      index

    end


  end

end
