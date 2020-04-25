require 'pry'

class Game
  #extend Players

  attr_accessor :board

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    self.player_1 = player_1 if player_1
    self.player_2 = player_2 if player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Top column
    [1,4,7], # Middle column
    [2,5,8], # Bottom column
    [0,4,8], # Diag A
    [6,4,2], # Diag B
  ]

  #def board
  #  @board
  #end

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_1
    @player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def player_2
    @player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_state|
      if (win_state.all? {|index| @board.taken?(index+1)}) && (win_state.all? {|index| @board.cells[index] == "X"} || win_state.all? {|index| @board.cells[index] == "O"})
        return win_state
      end
    end
  end

  def draw?
    if @board.full? && !won?
      return true
    end
  end

  def over?
    if won? || draw? || @board.full?
      return true
    end
  end

  def winner
    if won?
      return @board.cells[won?[0]]
    end
  end

  def turn
    #input = ""
    puts("Please enter 1-9:")
    index = @board.input_to_index(current_player.move(@board))
    #binding.pry
    if @board.valid_move?(index+1)
       @board.update(index+1,current_player)
       @board.display
    else
      puts("invalid")
      turn
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
        puts "Congratulations #{winner}!"
    end
  end
end
