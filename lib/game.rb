require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  # a constant with all possible win combinations
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # First column
    [1, 4, 7], # Second column
    [2, 5, 8], # Third column
    [0, 4, 8], # Diagonal
    [2, 4, 6] # Diagonal
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    game_won = false
    WIN_COMBINATIONS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      if (board.cells[index1] == "X" && board.cells[index2] == "X" && board.cells[index3] == "X") ||
         (board.cells[index1] == "O" && board.cells[index2] == "O" && board.cells[index3] == "O")
         return combination
      end
    end
    game_won
  end

  def full?
    board.cells.all? {|token| token != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combination = won?
    if win_combination
      winning_token = board.cells[win_combination[0]]
      winning_token
    end
  end

  def turn
    player = current_player
    player.move(board)
    board.display
  end

  def play
    board.display
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
