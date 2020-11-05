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
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
      (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")

    end
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
    input = current_player.move(input)
    #unless over?
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      puts "invalid"
      self.turn
    end
  end

  def play
    until over?
      self.turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end

end
