require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2], #0 'top row win'
    [3,4,5], #1 'middle row win'
    [6,7,8], #2 'bottom row win'
    [0,3,6], #3 'first column win'
    [1,4,7], #4 'second column win'
    [2,5,8], #5 'third column win'
    [0,4,8], #6 'left diagonal win'
    [2,4,6]  #7 'right diagonal win'
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.even? == true
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
	      win_index_1 = win_combination[0]
	      win_index_2 = win_combination[1]
	      win_index_3 = win_combination[2]

        @board.cells[win_index_1] == @board.cells[win_index_2] && @board.cells[win_index_2] == @board.cells[win_index_3] && @board.cells[win_index_1] != " "

    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    winner = won?

    if winner
      winning_char = winner[1]
      @board.cells[winning_char]
    else
      nil
    end
  end

  def turn
    player_move = current_player.move(board)

    if board.valid_move?(player_move)
      board.update(player_move, current_player)
      board.display
    else
      turn
    end

  end

  def play

    while !over? # If the game hasn't ended yet, we run a loop on the 'turn' method.
		 	turn
		end

		if draw? # If the game is a draw, we output the message below
			puts "Cat's Game!"
		else # But if it isn't a draw, then it means someone has won.
 			puts "Congratulations #{winner}!" # We then output the winning player through interpolating the winner method.
		end

  end

end
