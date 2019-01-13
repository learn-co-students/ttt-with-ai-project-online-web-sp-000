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
