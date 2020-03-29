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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.cells.count(" ") % 2 != 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.map { |index| @board.cells[index] }.count("X") == 3
        return combo
      elsif combo.map { |index| @board.cells[index] }.count("O") == 3
        return combo
      end
    end
    false
  end

  def draw?
    !won? && @board.cells.count(" ") == 0
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    @board.display
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      puts "Please enter a valid move"
      turn
    end
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
    @board.display
  end
end