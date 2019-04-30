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
    puts "It is No.#{@board.turn_count+1} round! And it is #{current_player.token}'s turn!"
    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
       @board.update(user_input, current_player)
       @board.display
    else  puts "Wrong input."
      @board.display
      turn
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
  puts "Do you want to play again? [y/n]"
  input=gets.strip
  start if input=="y"
end

def start
  @board.reset!
  puts "Hi, welcome to Tic Tac Toe World!"
  puts "Here we have three modes for you to choose, please input the number so you will start a game!"
  puts "1.0 player(computer will play themselves)"
  puts "2.1 player(you are going to compete with a computer)"
  puts "3.2 player (you can play with your friend)"
  @board.display

  input=gets.strip
  case input.to_i
  when 1
    zero_player
  when 2
    one_player
  when 3
    two_player
  else
    start
  end
end

def zero_player
  puts "OK,now computers start to play against each other!"
  @player_1=Players::Computer.new("X")
  @player_2=Players::Computer.new("O")
  play
end

def one_player
  puts "You want to play with the computer? Great!Do you want to go first or second?[f/s] The first one will be assigned an \"X\"."
  input= gets.chomp
  if input=="f"
   @player_1=Players::Human.new("X")
   @player_2=Players::Computer.new("O")
else
  @player_1=Players::Computer.new("X")
  @player_2=Players::Human.new("O")
end
  play
end

def two_player
   puts "You want to play with your friend? Great!Whoever plays first will be assigned an \"X\"!"
   play
end

end
