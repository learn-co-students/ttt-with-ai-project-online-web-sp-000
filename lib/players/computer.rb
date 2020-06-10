module Players
  class Computer < Player
    def move(board)
      #If first to Play
      #first turn: pick a corner
      #second turn: if opponent pick a corner=>pick any availabe corner
      #             if opponent pick middle=>pick opposite corner
      #the rest of the turn: check about_to_win? place win/block win move : random
      #otherwise, try to pick middle cell, or corner, or random

      if token=="X"
        if board.turn_count==0
          corner_index=Board::CORNERS_INDEXS.sample
          (corner_index+1).to_s
        elsif board.turn_count==2
          if board.cells[4]=="O"
            (9-board.cells.index("X")).to_s
          else
            (board.available_corner_index+1).to_s
          end
        elsif board.check_about_to_win?&&board.possible_winner_token=="X"
          board.win_or_lose_move
        elsif board.check_about_to_win?&&board.possible_winner_token=="O"
          board.win_or_lose_move
        elsif board.cells[4]==" "
          "5"
        elsif board.available_corner_index
          (board.available_corner_index+1).to_s
        else
          (board.cells.index(" ")+1).to_s
        end
# if second to play
# check about_to_win? place win/block win move : random
# otherwise, try to pick middle cell, or corner, or random
      else
        if board.check_about_to_win?&&board.possible_winner_token=="O"
          board.win_or_lose_move
        elsif board.check_about_to_win?&&board.possible_winner_token=="X"
          board.win_or_lose_move
        elsif board.cells[4]==" "
          "5"
        elsif board.available_corner_index
          (board.available_corner_index+1).to_s
        else
          (board.cells.index(" ")+1).to_s
        end
      end
    end
  end
end
