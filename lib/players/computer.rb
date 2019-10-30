module Players
  class Computer < Player
    def initialize(token)
      super
      @move_pool = ["1","2","3","4","5","6","7","8","9"].shuffle
    end
    def move(board)
      current_move = "-5"
      until board.valid_move?(current_move)
        current_move = @move_pool.pop
      end
      current_move
    end
  end
end