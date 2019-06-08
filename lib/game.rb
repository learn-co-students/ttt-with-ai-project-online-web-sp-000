class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # First column
    [1,4,7],  # Second column
    [2,5,8],  # Third column
    [0,4,8],  # First diagonal
    [6,4,2]  # Second diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      check = [@board.cells[win_combination[0]], @board.cells[win_combination[1]], @board.cells[win_combination[2]]]
      return win_combination if !check.any? { |token| token == " "} && check.all? { |token| token == check[0] }
    end
    false
  end

  def draw?
    if !won? && board.full?
      return true
    end
  end

  def over?
   draw? || won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    move = current_player.move(@board)
    turn if !@board.valid_move?(move)
    @board.update(move, current_player)
  end

  def play
    while !over?
      turn
      board.display
      puts "\n"
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

end
