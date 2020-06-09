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
          board.update_with_index(corner_index,self)
        end

        if board.turn_count==2
          if board.cells[4]=="O"
            oppo_corner_index=8-corner_index
            board.update_with_index(oppo_corner_index,self)
          else
            board.update(board.available_corners_index.sample,self)
          end
        end

        if board.check_about_to_win?
          index=board.check_about_to_win?.detect{|x|board.cells[x]==" "}
          board.update_with_index(index,self)
        else
          board.update_with_index(4,self) if board.cells[4]==" "
          board.update_with_index(board.available_corners_index.sample,self) if board.available_corners_index
          board.update_with_index(board.cells.index(" "),self)
        end
# if second to play
# check about_to_win? place win/block win move : random
# otherwise, try to pick middle cell, or corner, or random
      else
        if board.check_about_to_win?
          index=board.check_about_to_win?.detect{|x|board.cells[x]==" "}
          board.update_with_index(index,self)
        else
          board.update_with_index(4,self) if board.cells[4]==" "
          board.update_with_index(board.available_corners_index.sample,self) if board.available_corners_index
          board.update_with_index(board.cells.index(" "),self)
        end
      end
    end
  end
end
