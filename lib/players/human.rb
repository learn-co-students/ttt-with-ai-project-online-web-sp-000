module Players
  class Human < Player
    attr_accessor :ancestors
     def initialize(token)
      @ancestors = []
      @token = token
    end
     def move(board)
      gets.strip
    end
  end
end
