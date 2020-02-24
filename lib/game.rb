require 'pry'
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
      [6, 4, 2]
    ].freeze

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    # TODO: What logic do we need here?
    @player_1
  end

  #Game class represents a singular instance of a Tic-tac-toe session.
# def turn_count
# end

# def draw?
# end
#returns true for a draw
#return false for a won game


#returns false for a draw( if no WIN_COMBINATIONS)
#returns the correct winning combination in the case of a win

# def winner
# end

# def start
# end

# def play
# end

# def turn
# end


end