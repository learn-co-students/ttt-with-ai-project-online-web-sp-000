module Players
  class Computer < Player

    def initialize(token)
      super(token)
    end
    
    def move(board)
      (rand(8) + 1).to_s
    end
  end
end
