require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top Row
    [3,4,5],  # Middle Row
    [6,7,8],  # Bottom Row
    [0,4,8],  # Diagonal Right
    [2,4,6],  # Diagonal Left
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8]   # Right Column
  ]

  def current_player
    if board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0] + 1
      win_index_2 = win_combo[1] + 1
      win_index_3 = win_combo[2] + 1

      position_1 = @board.position(win_index_1)
      position_2 = @board.position(win_index_2)
      position_3 = @board.position(win_index_3)

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
  end

  def draw?
    if @board.full? && self.won? == false
      true
    else
      false
    end
  end

  def over?
    if self.draw? || self.won?
      true
    else
      false
    end
  end

  def winner
    if self.won?
      check = self.won?
      if @board.position(check[0] + 1) == "X"
        "X"
      else
        "O"
      end
    end
  end

  def turn
    input = current_player.move(@board)
    while @board.valid_move?(input) == false
      input = current_player.move(@board)
    end
    @board.update(input, current_player)
  end

  def play
    until over?
      @board.display
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
