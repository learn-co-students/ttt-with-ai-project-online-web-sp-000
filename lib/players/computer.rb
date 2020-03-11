require 'pry'
module Players
  class Computer < Player
    def move(board)
      position = rand(1..9)
      position.to_s
    end
  end
end