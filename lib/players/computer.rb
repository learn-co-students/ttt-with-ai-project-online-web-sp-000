# module Players
#   class Computer < Player
#
#     def move(board)
#       input = POSSIBLE_MOVES.sample(1)
#       board.valid_move?(input[0]) ? input[0] : input = POSSIBLE_MOVES.sample(1)
#     end
#   end
#
# end

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]]

    CORNER = [1, 3, 7, 9]

      def best_move(board)
        WIN_COMBINATIONS.detect do |position|  #checks all the combos to see if any player is close to a win. This could be an offensive or defensive move
          if board.cells[position[0]] == " " && board.cells[position[1]] == board.cells[position[2]]
            input = position[0] + 1 #added plus one because the options are 1-9
            return input.to_s
          elsif board.cells[position[1]] == " " && board.cells[position[0]] == board.cells[position[2]]
            input = position[1] + 1
            return input.to_s
          elsif board.cells[position[2]] == " " && board.cells[position[0]] == board.cells[position[1]]
            input = position[2] + 1
            return input.to_s
          else
            return nil #returns nil so the other cases could be met.
          end
        end
      end

      def corner(board)
        CORNER.detect {|input| board.valid_move?(input)}
      end

      def move(board)
        if (board.cells[4] == " ") #case to always pick middle if it is blank
          return "5"
        elsif (best_move(board) != nil) #case for a defensive move or to finish the game
          best_move(board)
        elsif (corner(board) != nil)
          self.corner(board) #case to pick a corner section
        else
          input = POSSIBLE_MOVES.sample(1)
          board.valid_move?(input[0]) ? input[0] : input = POSSIBLE_MOVES.sample(1)
        end
      end

    end
end
