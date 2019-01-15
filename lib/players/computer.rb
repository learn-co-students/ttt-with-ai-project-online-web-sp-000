# The idea of being efficient wanting to check the win combinations is good…just keep in mind that
#  the collection is not very big, the logic of checking WHICH combinations to check might outweigh
#  just checking all of those. You might be able to leverage one of ruby’s nice efficient methods like any?

# opt for a win combo rather than a block combo - more efficient
# check for a win combo first then check for a block combo

#first few moves determines the rest of the game => where strategy comes in

# take middle cell if empty
# after the first move, make another move based on empty cells
# once everyone has 2 tokens on the board, you use a win combo or a block combo and make a move
# =>iterate over win combos and block combo to check for a win use detect enumerable

# “X”, “X”, “”
# “O”,”O”,” “
# “ “, “X”, “ “

module Players
  class Computer < Player
    def move(board)
      move = nil
      #first move
      # if "5" in board is not taken
      if board(5).empty?
        move = "5"
      #first move if cell 5 is occupied
      # if "5" is not taken then take cell 3
      elsif board.turn_count == "1"
        move = "3"
      #if you went first and took cell 5, take a corner
    elsif board.turn_count == "2"
      move = [1, 3, 7, 9].detect {|cell| cell.empty?} #take cell }  #how to use .detect to make a token occupy a corner cell ruby

      # on the 3rd move if there are 2 matching tokens next to each other, take the spot that is next to it
      #check corners first then sides => take the one that is available first

      #check to see if there are any winning combinations (iterate through WIN_COMBINATIONS)

     # if cell is taken that is next to your token, use block method(write out a block method)

      end
    end
  end
end
