module Players
  class Human < Player
    def move(board)
      "Select a spot (1 - 9):"
      gets.strip
    end
  end
end
