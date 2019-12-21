module Players
  class Human < Player
     def initialize(token)
      @token = token
    end
     def move(board)
      gets.strip
    end
  end
end
