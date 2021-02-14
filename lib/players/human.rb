module Players
  class Human < Player

    def move(board)
      user_input = gets.strip
      return user_input
    end

  end
end

# passes in a board argument and allows a human player to enter a move.
# the method should return this value.
