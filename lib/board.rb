class Board
  attr_accessor :cells 
  def initialize
    reset! 
  end 
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " "," ", " "]
  end 
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  def position(space)
    space.to_i - 1
  end 
  def update(str, token)
    if(valid_move?(str))
      idx = position(str)
      @cells[idx] = token 
    end 
  end 
  def token(token)
    #call token method on player in move method (???)
  end 
  def full?
    @cells.all? {|square| square != " "} 
  end 
  def turn_count
    @cells.count{|square| square != " " }
  end 
  def taken?(str)
    idx = position(str)
    @cells[idx] != " "
  end 
  def valid_move?(str)
    idx = position(str)
    !taken?(idx) && idx.between?(0, 8)
  end 
end 

#   def current_player
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