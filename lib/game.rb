require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :turn_number

  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ].freeze

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @turn_number = 1
  end

  def current_player
    if turn_number.odd?
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      cell_values_for_combo = win_combo.map { |pos| @board.cells[pos] } # ["X", "X", "X"]
      # Check if all of them are the same token for this combo.
      if [["X", "X", "X"], ["O", "O", "O"]].include? cell_values_for_combo
        return win_combo
      end
    end
    false
  end

  def draw?
    return false if board.cells.include?(" ")
    return false if won?
    true
  end

  def over?
    return true if draw?
    return true if won?
    false
  end

  def winner
    winning_combo = won?
    return nil unless winning_combo
    pos = winning_combo[0]
    tokens_on_board = board.cells
    token = tokens_on_board[pos]
    return token
  end

# def start
# end

# def play
# end

  def turn
    # Make sure current_player keeps track of whose turn it is
    current_move = current_player.move(board)
    valid_move = board.valid_move?(current_move)
    return turn unless valid_move

    # We have a valid move, so change whose turn it is
    @turn_number += 1
  end
end
