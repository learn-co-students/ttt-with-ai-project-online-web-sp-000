require 'pry'
# take middle cell if empty
# after the first move, make another move based on empty cells
# once everyone has 2 tokens on the board, you use a win combo or a block combo and make a move
# =>iterate over win combos and block combo to check for a win use detect enumerable
 module Players
   class Computer < Player
     def move(board)
       move = nil
#       #first move
#       # if "5" in board is not taken
     if board.cells[5].empty?
       move = "5"
#       #first move if cell 5 is occupied
#       # if "5" is not taken then take cell 3
     elsif board.turn_count == "1"
       move = "3"
#       #if you went first and took cell 5, take a corner
     elsif board.turn_count == "2"
       move = ["1", "3", "7", "9"].detect {|position| !board.taken?(position)} #make a token occupy a corner cell ruby
       # on the 3rd move if there are 2 matching tokens next to each other, take the spot that is next to it
       #check corners first then sides => take the one that is available first
     elsif board.turn_count == "3"
       move = ["1", "3", "7", "9"].detect {|position| !board.taken?(position)}

     else # Take a side
       move = ["2", "4", "6", "8"].detect {|position| !board.taken?(position)}

     Game::WIN_COMBINATIONS.detect do |combo|
       if combo.select {|element| board.position((element + 1).to_s) == token}.length == 2 && combo.any? {|space| board.position((space + 1).to_s).empty?}
         move = combo.detect {|int| board.position((int + 1).to_s).empty?}
       end
     end
     # iterate over win_combination if I cant make a winning move block the opponent
     # if the opponent can win block them
      move = [1, 3, 7, 9, 2, 4, 6, 8].detect {|i| !board.taken?(i)}.to_s if move == nil
     end
     move.to_s
   end
 end
 end
