class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] && @board.cells[win_combo[1]] == @board.cells[win_combo[2]] && (@board.cells[win_combo[0]] == "X" || @board.cells[win_combo[0]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    @board.full? || won? || draw?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    else
      nil
    end
  end

  def turn
    player = current_player
    index = player.move(board)
    if !board.valid_move?(index)
      turn
    else
      board.update(index, player)
      board.display
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
