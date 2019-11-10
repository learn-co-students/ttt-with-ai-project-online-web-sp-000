class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end
  def draw?
    !won? && @board.full?
  end
  def over?
    draw? || won?
  end
  def winner
    if won?
      return @board.cells[won?[0]]
    end
  end
  def turn
    player = current_player
    position = player.move(@board)
    if @board.valid_move?(position)
      @board.update(position, player)
    else
      turn
    end
    @board.display
  end
  def play
    until over?
      turn
    end
    if won?
      winner == "X" ||  winner == "O"
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
