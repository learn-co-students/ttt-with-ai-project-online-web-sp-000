require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
#  DEFAULT_BOARD = Board.new
#  DEFAULT_P1 = Players::Human.new("X")
#  DEFAULT_P2 = Players::Human.new("O")

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = player_1
  end

  def board=(inputBoard)
    @board = inputBoard
  end

  def board
    @board
  end

  def change_player
    if (@current_player == @player_1)
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def current_player
    @current_player
  end

  def won?
    WIN_COMBINATIONS.each do | selectedCombo |
      if (@board.value_at(selectedCombo[0]) == @board.value_at(selectedCombo[1]) && @board.value_at(selectedCombo[1]) == @board.value_at(selectedCombo[2]) && @board.value_at(selectedCombo[0] != " "))
        return selectedCombo
      end
    end
    return false
  end

  def draw?
    if (@board.full?)
      if !(self.won?)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def over?
    if (self.won? || self.draw?)
      return true
    else
      return false
    end
  end

  def winner
    #binding.pry
    if (self.won? != false)
      winArray = self.won?
      return @board.value_at(winArray[0])
    else
      return
    end
  end

  def turn
    chosenSpace = @current_player.move(@board)
    @board.update(chosenSpace, @current_player)
    self.change_player
  end

  def play
    while !(self.over?)
      self.turn
      @board.display
    end
    if (self.won?)
      return "Congratulations, #{self.winner}"
    else
      return "Cat's Game!"
    end
  end




end
