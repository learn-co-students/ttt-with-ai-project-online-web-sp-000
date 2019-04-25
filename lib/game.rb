class Game

attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left side
    [1,4,7], #center
    [2,5,8], #right side
    [6,4,2], #diagonal bottom left to top right
    [0,4,8] #diagonal top left to bottom right
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @winner = board.cells[winning_combo.first]
    end
  end

  def start

  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board, index, value = "X")
    board[index] = value
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.display
      @board.update(current_move, current_player)
      @board.display
    end
  end

end
