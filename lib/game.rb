require 'pry'
class Game #each instance method should represent a discrete, single responsibility/functionality
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #1st column
  [1, 4, 7], #2nd column
  [2, 5, 8], #3rd column
  [0, 4, 8], #diag1
  [2, 4, 6], #diag2
  ]
  
  attr_accessor :board, :player_1, :player_2, :user_input
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    
    @board = board
    @player_1 = player_1
    @player_2 = player_2

  end 
  
  def current_player
    if board.turn_count.even? 
      return player_1
    else 
      return player_2
    end
  end 
  
  def over?
    (won? || draw?) ? true : false
  end
  
  def won?
      WIN_COMBINATIONS.each do |combination|   #[0,1,2] which is board range (0-8)
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
          #Need to +1, because #taken? rspec test is working off user_input range (1-9)
          return combination
        end
      end
    return false
    end
  
  def draw?
    @board.full? && !won? 
  end 
  
  
  def winner
    if won?
      win_combination = won?
      @board.cells[win_combination[0]]
    end 
  end 

  def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      sleep(1)
      turn
    end
    @board.display
    sleep(1)
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw? 
      puts "Cat's Game!"
    end 
  end
  
def start
  puts "Welcome to Tic Tac Toe!"
  puts "What kind of game would you like?"
  puts "For 0 players, enter '0'"
  puts "For 1 players, enter '1'"
  puts "For 2 players, enter '2'"
  start_input = gets.strip 
  if start_input == "0"
    Board.new.display
    Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
  elsif start_input == "1"
    Board.new.display
    Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
  elsif start_input == "2"
    Board.new.display
    Game.new.play
  elsif start_input == "exit"
  end 
end

end 

