class Game
  ##`WIN_COMBINATIONS`
# Define a `WIN_COMBINATIONS` constant within the `TicTacToe` class, and set it equal to a nested array filled with the
# index values for the various winning combinations possible in Tic Tac Toe.
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    #player_1 needs to access the Players module and then the Human who is playing as "X", then makes a new instance when needed
    #player_2 needs to access the Players module and then the other Human who is playing as "O", then makes a new instance when needed
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player #returns the correct player, X, for the third move
    @board.turn_count.odd? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combinations|
      @board.cells[combinations[0]] == @board.cells[combinations[1]] &&
      @board.cells[combinations[1]] == @board.cells[combinations[2]] &&
      @board.taken?(combinations[0] +1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    @board.full? || won? || draw?
  end

  def winner
    if won?
      combination = won?
      @board.cells[combination[0]]
    end
  end


  def turn
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
       @board.update(@user_input, current_player)
       @board.display
    else puts "Please enter a number 1-9:"
      turn
    @board.display
    end
  end


  def play
     while !over? do
      turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
    end
end
