module Players
  class Human < Player
    def move(board)
      user_request = gets.strip
    end
  end
end
