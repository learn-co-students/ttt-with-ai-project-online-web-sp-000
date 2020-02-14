require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  def initialize(player1=nil, player2=nil, board=nil)
    if(player1)
      @player_1 = player1
    else 
      @player_1 = Players::Human.new("X") 
    end 
    if(player2)
      @player_2 = player2
    else 
      @player_2 = Players::Human.new("O")
    end 
    if(board)
      @board = board   
    else 
      @board = Board.new 
    end 
  end 
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  
  def current_player 
    @board.turn_count.even? ? @player_1 : @player_2 
  end 
  
  def board 
    @board 
  end 
  
  def draw?
    @board.full? && !won?
  end
  
  def won? 
    WIN_COMBINATIONS.any? do |combo|
      if (@board.taken?(combo[0] + 1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]])
        return combo
      end
      if !combo 
        return false 
      end 
    end
  end 
  def winner
    if won?
      @board.cells[won?[0]]
    else 
      nil
    end 
  end 
  
  def start 
  end
  
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  
  def turn 
    @board.display 
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
    else
      turn
    end
    @board.display
  end 
  def over?
    won? || draw?
  end
end 