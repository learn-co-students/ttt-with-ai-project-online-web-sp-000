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
          (Board::CORNERS_INDEXS.sample+1).to_s
        end

        if board.turn_count==2
          if board.cells[4]=="O"
            (oppo_corner_index=8-corner_index+1).to_s
          else
            (board.available_corners_index.sample+1).to_s
          end
        end

        if board.check_about_to_win?
          index=board.check_about_to_win?.detect{|x|board.cells[x]==" "}
          (index+1).to_s
          "5"
        elsif board.available_corners_index
          (board.available_corners_index.sample+1).to_s
        else
          (board.cells.index(" ")+1).to_s
        end
# if second to play
# check about_to_win? place win/block win move : random
# otherwise, try to pick middle cell, or corner, or random
      else
        if board.check_about_to_win?
          index=board.check_about_to_win?.detect{|x|board.cells[x]==" "}
          (index+1).to_s
        elsif board.cells[4]==" "
          "5"
        elsif board.available_corners_index
          (board.available_corners_index.sample +1).to_s
        else
          (board.cells.index(" ")+1).to_s
        end
      end
    end
  end
end
