class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]



  def initialize(p_1 = Players::Human.new("X"), p_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = p_1
    self.player_2 = p_2
    self.board = board
    # binding.pry
  end

  def board
    @board
  end

  def current_player
      @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    win_combo =
      WIN_COMBINATIONS.find_all do |combo|
        # binding.pry
        @board.taken?(combo[0]) &&
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]]
      end.flatten

    win_combo.empty? ? false : win_combo
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    return @board.cells[won?[0]] if won?
  end

  def turn
    current_player.move(@board)
  end
end
