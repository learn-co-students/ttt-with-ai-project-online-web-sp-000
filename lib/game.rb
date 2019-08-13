
class Game

    WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,4,8], [2,4,6],
    [0,3,6], [1,4,7], [2,5,8],
    ]

attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      @board.cells[index_1] == @board.cells[index_2] &&
      @board.cells[index_2] == @board.cells[index_3] &&
      @board.taken?(index_1 + 1)
      end
    end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if win = won?
      @board.cells[win.first]
    end
  end

  def turn
    user_input = current_player.move(board)
  if @board.valid_move?(user_input)
    @board.update(user_input, current_player)
    @board.display
  else
 puts "Please enter a valid move"
    turn
  end
end

  def play
    while !over?
      turn
      draw?
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
