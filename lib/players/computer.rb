module Players

  class Computer < Player

    def move(board)
      sleep(1.5)
      (1..9).to_a.sample.to_s
    end

  end
end
