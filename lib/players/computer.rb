require 'pry'
module Players
  class Computer < Player
    def move(board)
      input = rand(9)
    until input != 0 do
      input = rand(9)
    end
    input.to_s
    end
  end
end
