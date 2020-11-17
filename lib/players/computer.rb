module Players
  class Computer < Player

    def move(board)
      if board.taken?("5") == false
        "5"
      elsif board.taken?("5")
        corner(board) || random
      end
    end

    def corner(board)
      corners = [1,3,7,9]
      corners.find { |corner| board.taken?(corner) == false }
    end

    def random
      (1..9).to_a.sample
    end

    def opponent_token
      self.token == "X" ? "O" : "X"
    end

  end
end
