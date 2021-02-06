require 'pry'

class Game
  
  attr_accessor :player_1, :player_2, :board
  
  # Define Winning Combinations Constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
  def initialize (p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), b = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = b
  end

  def current_player
    self.board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      result = win_combination
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]
      position_1 = self.board.cells[win_index1]
      position_2 = self.board.cells[win_index2]
      position_3 = self.board.cells[win_index3]
      if position_1 == position_2 && position_1 == position_3 && self.board.taken?(win_index1 + 1)
        return result
      end
    end
    false
  end


  def draw?
    if self.won?
      return false
    elsif self.board.full?
      return true
    else
      return false
    end
  end

  def over?
    if self.won? || self.draw? || self.board.full?
      return true
    else
      return false
    end
  end
  
  def winner
    if self.won?
      win_combination = self.won?
      @board.cells[win_combination[0]]
    else
      nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    if self.current_player.move(self.board) == false
      self.turn
    else
      self.board.display
    end
  end
  
  def play
    # for additional players
    until self.over?
      self.turn
    end
    if self.won?
       puts "Congratulations " + self.winner + "!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
      
end
  