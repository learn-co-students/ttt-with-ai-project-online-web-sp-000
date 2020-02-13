class Game
  attr_accessor :player_1, :player_2
  def initialize(player1, player2)
    @player_1 = player1 
    @player_2 = player2
    Board.new
  end 
  def current_player 
    Board.turn_count.even? ? "X" : "O"
  end 
  def won? 
  end 
  def winner 
  end 
  def start 
  end 
  def play 
  end 
  def turn 
  end 
end 

#def current_player
#     turn_count.even? ? "X" : "O"
#   end

#   def turn
#     puts "Please enter a number (1-9):"
#     user_input = gets.strip
#     index = input_to_index(user_input)
#     if valid_move?(index)
#       token = current_player
#       move(index, token)
#     else
#       turn
#     end
#     display_board
#   end

#   def won?
#     WIN_COMBINATIONS.any? do |combo|
#       if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
#         return combo
#       end
#     end
#   end

#   def draw?
#     full? && !won?
#   end

#   def over?
#     won? || draw?
#   end

#   def winner
#     if combo = won?
#       @board[combo[0]]
#     end
#   end

#   def play
#     turn until over?
#     puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#   end
# end