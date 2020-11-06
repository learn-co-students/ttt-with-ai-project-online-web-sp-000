require 'pry'
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
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    #binding.pry
    WIN_COMBINATIONS.detect do |winner|
      if @board.cells[winner[0]] == @board.cells[winner[1]] &&
        @board.cells[winner[1]] == @board.cells[winner[2]] &&
        @board.taken?(winner[0]+1)
      #(@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
      return winner
      end
    end
    return false
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if token_win = won?
      @winner = @board.cells[token_win.first]
    end
  end

  def turn
  move = current_player.move(board)
  if !@board.valid_move?(move)
    turn
  else
    @board.update(move, current_player)
    @board.display
  end
end

  def play
  turn until over?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end

end
