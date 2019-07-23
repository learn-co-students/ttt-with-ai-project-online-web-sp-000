require 'pry'
class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

attr_accessor :board, :player_1, :player_2

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
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else turn
  end
  display_board
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
        position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]]  == @board[combo[2]]
      end
  end
def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
    if won?
       @board[won?[1]]
    end
end



end
