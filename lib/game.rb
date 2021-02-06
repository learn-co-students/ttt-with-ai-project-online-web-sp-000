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
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      result = win_combination
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]
      position_1 = @board.position(win_index1 + 1)
      position_2 = @board.position(win_index2 + 1)
      position_3 = @board.position(win_index3 + 1)
      if position_1 == position_2 && position_2 == position_3 && @board.taken?(win_index1)
        return result
      end
    end
    nil
  end

  def draw?
    if self.won?
      return nil
    elsif self.board.full?
      return true
    else
      return nil
    end
  end

  def over?
    if self.won? || self.draw? || self.board.full?
      return true
    else
      return nil
    end
  end
  
  def winner
    if self.won? != nil
      win_combination = self.won?
      if self.board.position(win_combination[0] + 1) == "X" && self.board.position(win_combination[1] + 1) == "X" && self.board.position(win_combination[2] + 1) == "X"
        player_1.token
      elsif self.board.position(win_combination[0] + 1) == "O" && self.board.position(win_combination[1] + 1) == "O" && self.board.position(win_combination[2] + 1) == "O"
        player_2.token
      else
        nil
      end
    end
  end

  def turn
    puts "Please enter 1-9:"
    if self.current_player.move(self.board) == false
      puts "invalid"
      self.turn
    else
      self.board.display
    end
  end

end

