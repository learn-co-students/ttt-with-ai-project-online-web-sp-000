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
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def winning_combo?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?
    !winning_combo? && board.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def won?
    if winning_combo? != nil
      winning_combo?
    elsif !draw?
      false
    end
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      board.cells[winning_combo?[0]]
    else
      nil
    end
  end

  def turn
    current_player.move(board)
    if board.valid_move?(current_player.input.to_i - 1)
      update(current_player.input.to_i - 1, current_player)
    else
      current_player.move(board)
    end
  end

end
