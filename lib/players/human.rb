module Players
  class Human < Player
    def move(user_input)
      user_request = gets.strip
    end
  end
end
