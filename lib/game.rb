class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      return @player_1
    elsif @board.turn_count.odd?
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|

      position_1 = @board.cells[combo[0]]
      position_2 = @board.cells[combo[1]]
      position_3 = @board.cells[combo[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return [combo[0], combo[1], combo[2]]
      end
    end
    false
  end

  def draw?
    if won? == false && @board.full? == true
      return true
    end
  end

  def over?
    if won? != false || draw? == true
      return true
    else
      false
    end
  end

  def winner
    if won? == false
      return nil
    else
      return @board.cells[won?[0]]
    end
  end

  def turn
    binding.pry
    until self.current_player.move(@board).valid_move?(@board) == true
      "invalid"
    end
    @board.update(self.current_player, self.current_player.move(@board))
  end

end
