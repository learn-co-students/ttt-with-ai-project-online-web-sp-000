
class Game 
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board 
      @board.display
      
  end
  
  def current_player
  if board.turn_count.odd?
    player_2
  else
    player_1
  end
end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      
    if win_combination.all?{|player_1| @board.cells[player_1] == "X"}
      return win_combination
    elsif win_combination.all?{|player_2| @board.cells[player_2] == "O"}
      return win_combination
    end
    end
    return false
  end
  
  def draw?
   !won? && board.full?
 end
 
  def over?
    won? || draw? 
    
  end
  
  def winner
   if draw? || !board.full? && !won?
     return nil
   elsif @board.cells[won?[0]] == "X"
   return "X"
   elsif @board.cells[won?[0]] == "O"
   return "O"
   end
 end
  
def turn
  puts "It's #{self.current_player.token}'s turn."
  puts "To make a move please enter a number 1-9"
  input = self.current_player.move(board).to_i  
  if board.valid_move?(input.to_s)
    board.update(input, current_player)
    @board.display
  else
    puts "You entered an invalid move. Please try again"
    turn 
  end
end

def play
  while !over? && !won? && !draw?
  turn
  end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
end
  
   

def game_start
 puts "How many players would like to play?"
 puts "Please enter 1, 2, 0, or wargames"
 puts    "1 - for You vs. Computer"
 puts    "2 - for Human vs. Human" 
 puts    "0 - for Computer vs. Itself"
 puts    "wargames - the computer plays itself 100 times and reports how many victories are acheived"
 
 game_type = gets.chomp
 
 if game_type == "1" 
   puts "Would you like to go first?  Y or N?"  
     if gets.chomp == "Y"
     Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
     else
     Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
     end
  
  elsif game_type == "2"
    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
  
  elsif game_type == "0"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    
  elsif game_type == "wargames"
    games = 0
    victories = 0
    while games < 100 
     Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play 
     if won? 
       victories += 1
     end
     games += 1 
   end
   puts "There were #{victories} victories acheived"
   end
  
  puts "Would you like to play again? Y or N?" 
   
   game_start until gets.chomp == "N"
end

  
end