module Players
  class Computer < Player
    def move(board)
      valid_moves = []
      board.cells.each_with_index { |token, index| valid_moves << (index + 1).to_s if token == " " }
      valid_moves[rand(0..valid_moves.length-1)]
    end
  end
end