module Players
  class Human < Player

    def move(board)
      "Where would you like to go? (1-9)"
      gets.strip
    end

  end
end
