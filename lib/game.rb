
require "pry"
class Game
  attr_accessor :board, :player_1, :player_2,:win_array

 WIN_COMBINATIONS=[
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2] ]

def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
  @player_1=player_1
  @player_2=player_2
  @board=board

end

def current_player
  if @board.turn_count.even?
    @player_1
  else @player_2
  end
end

def won?
  @win_array=WIN_COMBINATIONS.find do |a|#the reason why i dont use .select because select will return the WIN_COMBINATIONS array in another array, while find will just return that array
    @board.cells[a[0]]==@board.cells[a[1]]&&@board.cells[a[1]]==@board.cells[a[2]]&&@board.cells[a[0]]!=" "
end
   if @win_array
     @win_array
   else false
   end
end


def draw?
  if @board.full? && !won?
    true
  end
end

def over?
  if won?||draw?
  true
end
end

def winner
  if won?
  @board.cells[ @win_array[0]]
  else  nil
  end
end

def turn
    puts "Please enter a number 1-9:"
    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    else turn
    end
  end

def play
  while !over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
      end
end

end
