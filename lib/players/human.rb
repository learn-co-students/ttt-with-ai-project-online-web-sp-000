module Players

  class Human < Player

    def initialize(board)
      @board = board
    end

    def move(board = nil)
      input = gets
      input
    end
  end
end
