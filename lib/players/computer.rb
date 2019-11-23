require_relative '../player.rb'

class Players::Computer < Player

  def move(board)
    valid_moves = []
    board.cells.each_with_index do |cell, index|
      if cell == " "
        position = index + 1
        valid_moves << position.to_s.strip
      end
    end
    binding.pry
    valid_moves

  end

end
