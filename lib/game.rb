require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :cells, :turn_count
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end
  
  def current_player
    if self.token == "X"
      @player_1
    else
      @player_2
    end
  end
  
  def token
    if board.turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def won?
    won = false
    won = WIN_COMBINATIONS.any? do |wins|
      if wins.all? {|i| board.cells[i] == "X"}
        return wins
      elsif wins.all? {|i| board.cells[i] == "O"}
        return wins
      end
    end
  end
  
  def winner
    if won? == false
      return nil
    end
    index = won?[0]
    if board.cells[index] == "X"
      "X"
    elsif board.cells[index] == "O"
      "O"
    else
      nil
    end
  end
  
def turn
  index = current_player.move(board)
  if board.valid_move?(index)
    board.update(index, current_player)
    board.display
  else
    self.turn
  end
end 
  
  def draw?
    if board.full?
      true unless won?
    else
      false
    end
  end
  
  def over? 
    if draw? || won?
      true
    else 
      false
    end
  end
  
  def play
    until(over?) 
      self.turn
    end
    
    if self.winner == "O"
      puts "Congratulations O!"
    elsif self.winner == "X"
      puts "Congratulations X!"
    else
      puts "Cat's Game!"
    end
    
  end
  
end