require_relative '../player.rb'

module Players 
  class Computer < Player 
    def move(board)
      #if corners not taken claim corner 
      #else claim middle 
      #
    end
    def valid?(idx)
      @board(idx) != "" && @board(idx) != " "
    end 
  end 
end 

# corners in idx = [0, 2, 6, 8]
# middle = 4 
# leftovers = 1, 3, 5, 7 
# def turn 
#     current_move = current_player.move(@board)
#     if @board.valid_move?(current_move)
#       @board.update(current_move, current_player)
#     else
#       turn
#     end
#     @board.display
#   end 