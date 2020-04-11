# class Game
#   attr_accessor :board, :player_1, :player_2
#
#   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#     @board = board
#     @player_1 = player_1
#     @player_2 = player_2
#   end
#   WIN_COMBINATIONS = [
#      [0,1,2], # Top row
#      [3,4,5], # Middle row
#      [6,7,8], # Bottom row
#      [0,3,6], # Left side
#      [1,4,7], # Center vertical
#      [2,5,8], # Right Side
#      [2,4,6], # Diagnol 1
#      [0,4,8] # Diagnol 2
#    ]
#
#    def current_player
#      @board.turn_count % 2 == 0 ? @player_1 : @player_2
#   #    count = board.cells.count{|turn| turn == "X" || turn == "O"}
#   #    if count % 2 == 0
#   #      return player_1
#   #    else
#   #      return player_2
#   #  end
#  end
#
#    def won?
#     WIN_COMBINATIONS.each do |wins|
#
#     win_index_1 = wins[0]
#     win_index_2 = wins[1]
#     win_index_3 = wins[2]
#
#     position_1 = @board.cells[win_index_1]
#     position_2 = @board.cells[win_index_2]
#     position_3 = @board.cells[win_index_3]
#
#     if (position_1 == "X" && position_2 == "X" && position_3 == "X")
#       return wins
#     elsif
#       (position_1 == "O" && position_2 == "O" && position_3 == "O")
#       return wins
#     end
#     end
#     false
#   end
#
#   def draw?
#     !won? && board.full?
#   end
#
#   def over?
#     draw? || won?
# end
#
#   def winner
#     if draw? == true; nil;
#     else
#
#     WIN_COMBINATIONS.each do |winarray|
#     win_index_1 = winarray[0]
#     win_index_2 = winarray[1]
#     win_index_3 = winarray[2]
#
#     position_1 = board.cells[win_index_1]
#     position_2 = board.cells[win_index_2]
#     position_3 = board.cells[win_index_3]
#
#     if position_1 == "X" && position_2 == "X" && position_3 == "X"
#       winner = "X"
#       return winner
#     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#       winner = "O"
#       return winner
#     else
#       nil
#     end
#     end
#       nil
#     end
#   end
#
#   def turn
#     player = current_player
#     current_move = player.move(board)
#     if !@board.valid_move?(current_move)
#       turn
#     else
#       puts "Turn: #{@board.turn_count+1}"
#       @board.display
#       @board.update(current_move, player)
#       puts "#{player.token} moved #{current_move}"
#       @board.display
#     end
#   end
#     # input = current_player.move(board)
#     #  if @board.valid_move?(input) == true
#     #    @board.update(input, current_player)
#     #  else
#     #    puts "Please enter a valid move."
#     #    turn
#     #    current_player.move(board)
#     #  end
#
#   def play
#      turn until over?
#        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#      end
# end
# #
# #   if won? && winner == "X"
# #     puts "Congratulations X!"
# #   elsif won? && winner == "O"
# #     puts "Congratulations O!"
# #   elsif draw?
# #     puts "Cat's Game!"
# #   end
# # end
class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

 def draw?
   @board.full? && !won?
 end

 def over?
   draw? || won?
 end

 def winner
   if combo = won?
     @board.cells[combo[0]]
   end
 end

 def turn
   player = current_player
   current_move = player.move(board)
   if !@board.valid_move?(current_move)
     turn
   else
     puts "Turn: #{@board.turn_count+1}"
     @board.display
     @board.update(current_move, player)
     puts "#{player.token} moved #{current_move}"
     @board.display
   end
 end

 def play
   turn until over?
   puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
 end
end
