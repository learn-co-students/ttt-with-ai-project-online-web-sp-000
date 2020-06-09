module Players
  class Computer < Player
    def move(board)
      human_readable=""
      if token=="X"
        if board==board.reset!
          corner_number=Board::CORNERS_NUMBERS.sample
          board.update(corner_number,self)
          human_readable=corner_number
        end

        if board.cells[4]=="O"
          oppo_corner=10-corner_number.to_i
          board.update(oppo_corner.to_s,self) if board.cells[oppo_corner-1]==" "
          board.update(board.available_corners.sample,self) if board.available_corners
          board.update(board.cells.index(" ")+1,self)
          human_readable=board.cells.index(" ")+1
        else
          board.update(board.available_corners.sample,self) if board.available_corners
          board.update(board.cells.index(" ")+1,self)
          human_readable=board.cells.index(" ")+1
        end

      else
        if board.check_about_to_win?
          board.check_about_to_win?.each do |x|
            if board[x]==" "
              board.update(x+1,self)
              human_readable=x+1
            end
          end
        else
          board.update(board.available_corners.sample,self) if board.available_corners
          board.update(board.index(" ")+1,self)
          human_readable=board.cells.index(" ")+1

        end
      end
    return human_readable.to_s
    end
  end
end
#If computer goes first, takes a random corner
#     if other players takes the corner, computer take another corner=>win
#     if other players takes the middle, go to oppo corner,if other player go to corner, go to the last corner,you win,
#                                                           if other players go to side, it will be a tie

#if computer goes second, random unless there is about_to_win present on board.
