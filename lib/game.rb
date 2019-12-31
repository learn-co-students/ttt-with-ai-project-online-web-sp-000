## Objectives
# 1. Build a command-line interface (CLI).
# 2. Create a domain model with multiple relating and collaborating objects.

class Game
  # extend Players::Human
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [6, 4, 2]
   ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),
                  board = Board.new)
     # defaults to two human players
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def current_player
     # returns the correct player, X, for the third move
     @board.turn_count.even? ? player_1 : player_2
   end
   
   def won?
     WIN_COMBINATIONS.detect do |win_combo|
       if (@board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X") || 
         (@board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O")
         win_combo
       else 
         false 
       end 
     end 
   end 
   
   def draw?
     if !won? && @board.full? 
       true 
     else 
       false 
     end 
   end 
   
   def over?
     if draw? || won? 
       true 
     else 
       false 
     end 
   end 
   
   def winner 
     if won?
       @board.cells[won?[0]]
     end 
     # binding.pry 
   end 
   
   def turn 
   end 

end

# =begin 
# describe '#won?' do
#     it 'returns false for a draw' do
#       game = Game.new
#       game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

#       expect(game.won?).to be_falsey
#     end

#     it 'returns the correct winning combination in the case of a win' do
#       game = Game.new
#       game.board.cells = ["X", "O", "X",
#                           "O", "O", "X",
#                           "O", "X", "X"]

#       expect(game.won?).to contain_exactly(2, 5, 8)
#     end

#     it "isn't hard-coded" do
#       game = Game.new
#       game.board.cells = ["O", "O", "O",
#                           "X", "X", " ",
#                           " ", " ", "X"]

#       expect(game.won?).to contain_exactly(0, 1, 2)
#     end
#   end
#   =end 


