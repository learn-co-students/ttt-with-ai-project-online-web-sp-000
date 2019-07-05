require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom column
    [0,3,6],  # left column
    [1,4,7],  # center column
    [2,5,8],  # right column
    [0,4,8],  # diagonal 1
    [2,4,6]  # diagonal 2
  ]

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def token
    if current_player == @player_1
      "X"
    else
      "O"
    end
  end

  def current_player
    @board.cells.count{|token| token == "X" || token == "O"}.even? ? @player_1 : @player_2
  end

  def X_win?
    status = false
    WIN_COMBINATIONS.each do |array|
      status = true if array.all? {|value| @board.cells[value]=="X"}
    end
    status
  end

  def O_win?
    status=false
    WIN_COMBINATIONS.each do |array|
      status=true if array.all? {|value| @board.cells[value]=="O"}
    end
    status
  end

  def won?
   if X_win? == true
     winning_combination = nil
     WIN_COMBINATIONS.detect do |combo|
       if combo.all? {|num| @board.cells[num]=="X"}
         winning_combination=combo
       end
     end
     winning_combination
   elsif O_win? == true
     winning_combination=nil
     WIN_COMBINATIONS.detect do |combo|
       if combo.all? {|num| @board.cells[num]=="O"}
         winning_combination=combo
       end
     end
     winning_combination
    else
     false
   end
  end

   def draw?
     if won?
       false
     elsif @board.full? == false
       false
     else
       true
     end
   end

   def over?
     draw? || won?
   end

   def winner
     if X_win?
       "X"
     elsif O_win?
       "O"
     else
       nil
     end
   end

   def valid_move?(input)
     cell = input.to_i
     cell >= 1 && cell <=9 && !taken?(input)
   end

   def turn
     puts "Please enter a number 1-9:"

     input = current_player.move(@board)
     until @board.valid_move?(input)
       puts "Please enter a number 1-9:"
       input = current_player.move(@board)
     end
     spot = input.to_i-1
     @board.cells[input.to_i - 1] = current_player.token
     @board.display
   end

   def play
     until over?
       turn
     end
     if X_win?
       puts "Congratulations X!"
     elsif O_win?
       puts "Congratulations O!"
     else
       puts "Cat's Game!"
     end
   end



end
