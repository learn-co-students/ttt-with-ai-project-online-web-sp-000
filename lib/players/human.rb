module Players
  class Human < Player

    def initialize(token)
      super(token)
    end

    def move(board)
      p "Please enter your move (1 - 9):"
      str = gets.chomp

    end
  end

end
