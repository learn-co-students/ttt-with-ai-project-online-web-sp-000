require 'pry'

module Players

  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end
    end

  end

end


#### Unworking Algorithm ####
#
#       input = nil
#       if board.cells[0] == " "
#         input = "1"
#       elsif board.cells[0] != " " && board.cells[4] == " "
#         input = "5"
#       elsif board.turn_count == 2 || board.turn_count == 3
#         input = [1,3,7,9].find{|e| !board.taken?(e)}.to_s
#  # - iterate through WIN_COMBINATIONS. Find a combination with two positions taken by the player's own token.
#  # - choose the third position.
#       elsif board.turn_count
#         Game::WIN_COMBINATIONS.detect do |combo|
#
#           if combo.select{|e| board.cells[e]==self.token}.size==2 && combo.any? {|e| board.cells[e]==" "}
# #            input = combo.select{|e| !board.taken?(e)}.first.to_i.+(1).to_s
#             cell = combo.detect{|e| board.cells[e]==" "}
#             cell = cell+1
#             input = cell.to_s
#           else combo.select{|e| board.cells[e]!=self.token && board.cells[e]!=" "}.count == 2
#             cell = combo.detect{|e| board.cells[e]==" "}
#             cell = cell+1
#             input = cell.to_s
#            end
#            input
#        end
#       else
#         available = board.cells.select {|e| e == " "}
#         input = available.sample
#       end
#       input
#     end
#
#   end
