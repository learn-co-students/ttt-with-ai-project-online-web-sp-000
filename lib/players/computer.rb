module Players

  class Computer < Player

    def move(board)
      puts "Computer's move:"
      sleep(1)
      input = self.computer_move(board)
    end

    def computer_move(board)
      trial = rand(1..9).to_s
      if board.valid_move?(trial)
        input = trial
      else
        computer_move(board)
      end
    end

  end

end
