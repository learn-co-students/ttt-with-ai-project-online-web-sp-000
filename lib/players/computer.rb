module Players
  class Computer < Player
    def move(board)
      board.cells.each_with_index do |pos, index|
        return (index + 1).to_s  if pos == " "
      end
    end
  end
end