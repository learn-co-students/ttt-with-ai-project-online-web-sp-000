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
    [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"),
    player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    win_status = false
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] != " " &&
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]]
        win_status = combo
      end
    end
    win_status
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    current_player.move(board)
  end

  def play
    until over?
      puts ""
      board.display
      turn
    end
    puts ""
    board.display
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
