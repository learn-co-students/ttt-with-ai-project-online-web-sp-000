require 'pry'
class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

attr_accessor :board, :player_1, :player_2

def self.new_game
  puts "Welcome to Tic Tac Toe!"
  puts "Would you like to play a 0, 1, or 2 player game?"
  input = gets.strip.to_i
  puts "If you would like to go first and be player X, enter (I Will), if not, enter (Them)."
  first_player = gets.strip
   if input == 0
     self.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
   elsif input == 1 && first_player == "I Will"
     self.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
   elsif input == 1 && first_player == "Them"
     self.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
   elsif input == 2 && first_player == "I Will"
     self.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
   end
   puts "Would you like to play again? (Y or N)"
     if gets.strip == "Y"
       new_game
     else
       puts "Goodbye, thank you for playing!"
   end
 end


def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
  # binding.pry
end

def current_player
  if board.turn_count % 2 == 0
    @player_1
  else
    @player_2
  end
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
def input_to_index(input)
  @index = input.to_i - 1
end
def move(index, player)
  @board[index] = player
end



def turn
  puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
end

def play
   until over?
    turn
   end
     if draw?
       puts "Cat's Game!"
     elsif winner
       puts "Congratulations #{winner}!"
     end
end

def won?
      WIN_COMBINATIONS.detect do |combo|
        board.taken?(combo[0] + 1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]]  == board.cells[combo[2]]

      end

  end
# binding.pry
def draw?
  board.full? && !won?
end

def over?
  won? || board.full? || draw?
end

def winner
   if won?
    combination = won?
    @board.cells[combination[0]]
      #  binding.pry
   end
end



end
