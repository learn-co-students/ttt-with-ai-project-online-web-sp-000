require'pry'
class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [8,4,0]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? == true ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.taken?(combo[0]+1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if var = won?
      index = var[0]
      @board.cells[index]
    end
  end

  def turn
    puts "Please enter a number 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
