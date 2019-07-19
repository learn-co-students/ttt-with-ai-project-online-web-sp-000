require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2           #provides access to the board, player_1, player_2

  WIN_COMBINATIONS = [            #Defined class Constant array
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [6, 4, 2]
  ]
  #Human class, has to be called inside its name space with Players::Human
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #returns the correct player, X, for the third move
  def current_player
    board.turn_count.even?  ? player_1 : player_2         #call to #turn_count & #even? on it. Ternary Operator
  end

  #returns false for a draw with #find method
  #returns the correct winning combination in the case of a win
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?
    board.full? && !won?              #calling #full? on board class
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?        #return X when X won and vice versa
  end

  def turn

  end
end
