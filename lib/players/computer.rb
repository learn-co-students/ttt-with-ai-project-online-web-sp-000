module Players
  class Computer < Player
    def move(board)
      predict = MinMax.new
      "#{predict.next_move(board)+1}"
    end
end