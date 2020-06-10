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
    [6,4,2],
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    winning_combo = WIN_COMBINATIONS.detect do |combination|
      combination.all? {|pos| board.cells[pos] == "X" } ||
      combination.all? {|pos| board.cells[pos] == "O" }
    end
    winning_combo ? winning_combo : false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    puts "Where would you like to move?"
    input = current_player.move(board)
    until board.valid_move?(input)
      puts "That is not a valid move, try again"
      input = current_player.move(board)
    end
    board.update(input, current_player)
    board.display
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
      "draw"
    else
      puts "Congratulations #{winner}!"
      "win"
    end
  end

end