module Computer
  class Computer < Player
    def move(board)
      i = 0
      indexes = []
      valid_moves = ["1","2","3","4","5","6","7","8"]
      if !(indexes.include? i)
        computer_move = valid_move[i]
        i += 1
      else
        i += 1
      end
    end
  end
  
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]