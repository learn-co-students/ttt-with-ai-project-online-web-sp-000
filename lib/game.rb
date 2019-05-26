require 'pry'
class Game 
  attr_accessor :board, :player_1, :player_2  
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [0, 3, 6],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  [6, 7, 8],
  [1, 4, 7]
  
  ]
  
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
    #binding.pry 
  end 
  
  def won?
    #binding.pry 
    if WIN_COMBINATIONS[0] == WIN_COMBINATIONS[1] && WIN_COMBINATIONS[1] == WIN_COMBINATIONS[2]
       return WIN_COMBINATIONS[0]
    end 
  end 
  
  
  
  
end 