require_relative "../player.rb"

module Players
  class Computer < Player
    def move(board)
      Board::MOVES.shuffle.find {|move| board.valid_move?(move)}
    end
  end
end
