# module Players
#   class Computer < Player
#     def move(board)
#       move = nil
#
#       # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
#       if !board.taken?(5)
#         move = "5"
#
#       # If going second and the middle square is taken, take the upper-left corner square.
#       elsif board.turn_count == 1
#         move = "1"
#
#       # If you went first (and took the middle), take a corner square with your second move.
#       elsif board.turn_count == 2
#         move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
#
#       # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
#       elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
#         move = "2"
#
#       # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
#       else
#         Game::WIN_COMBINATIONS.detect do |cmb|
#
#           # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
#           if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
#             move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
#
#           # If you can't play any winning moves, play a move to block the opponent from winning.
#           elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
#             move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
#           end
#         end
#
#         # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
#         move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
#       end
#       move
#     end
#   end
# end

#my solution:
module Players
  class Computer < Player

    WIN_COMBOS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def move(board)
      WIN_COMBOS.detect do |win|
        spot_1 = (win[0] + 1).to_s
        spot_2 = (win[1] + 1).to_s
        spot_3 = (win[2] + 1).to_s
        if board.cells[win[0]] == board.cells[win[1]] && board.cells[win[0]] != (" " || "")
          return spot_3 unless board.taken?(spot_3)
        elsif board.cells[win[1]] == board.cells[win[2]] && board.cells[win[1]] != (" " || "")
          return spot_1 unless board.taken?(spot_1)
        elsif board.cells[win[2]] == board.cells[win[0]] && board.cells[win[0]] != (" " || "")
          return spot_2 unless board.taken?(spot_2)
        end
      end

      if center_and_corners(board) != nil
        value = center_and_corners(board)
      else
        return final_spots(board)
      end
      value
    end

    def center_and_corners(board)
      if board.cells[4] == "" || board.cells[4] == " "
        return 5.to_s
      elsif board.cells[0] == "" || board.cells[0] == " "
        return 1.to_s
      elsif board.cells[2] == "" || board.cells[2] == " "
        return 3.to_s
      elsif board.cells[8] == "" || board.cells[8] == " "
        return 9.to_s
      elsif board.cells[6] == "" || board.cells[6] == " "
        return 7.to_s
      end
    end

    def final_spots(board)
      if board.cells[1] == "" || board.cells[1] == " "
        value = 2.to_s
      elsif board.cells[3] == "" || board.cells[3] == " "
        value = 4.to_s
      elsif board.cells[5] == "" || board.cells[5] == " "
        value = 6.to_s
      elsif board.cells[7] == "" || board.cells[7] == " "
        value = 8.to_s
      end
      value
    end

  end

end


 # (Random.new.rand(9) + 1).to_s

 #flation solution:
 #
 # module Players
 #   class Computer < Player
 #     def move(board)
 #       move = nil
 #
 #       # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
 #       if !board.taken?(5)
 #         move = "5"
 #
 #       # If going second and the middle square is taken, take the upper-left corner square.
 #       elsif board.turn_count == 1
 #         move = "1"
 #
 #       # If you went first (and took the middle), take a corner square with your second move.
 #       elsif board.turn_count == 2
 #         move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
 #
 #       # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
 #       elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
 #         move = "2"
 #
 #       # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
 #       else
 #         Game::WIN_COMBINATIONS.detect do |cmb|
 #
 #           # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
 #           if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
 #             move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
 #
 #           # If you can't play any winning moves, play a move to block the opponent from winning.
 #           elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
 #             move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
 #           end
 #         end
 #
 #         # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
 #         move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
 #       end
 #       move
 #     end
 #   end
 # end

 # ------------#flatiron solution above^
