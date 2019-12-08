# learn spec/04_game_spec.rb

require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

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

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}".colorize(:color => :black, :background => :white)
      @board.display
      puts "\n\n"
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

  def zero_player_version
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Computer.new("O")
    self.play
  end

  def one_player_version
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Computer.new("O")
    self.play
  end

  def two_player_version
    self.play
  end

  def start
    puts "Please select version:".colorize(:color => :black, :background => :white)
    puts "0. Zero Player".colorize(:green)
    puts "1. One Player".colorize(:green)
    puts "2. Two Player".colorize(:green)

    input = gets.strip
    if input == "0"
      zero_player_version
    elsif input == "1"
      one_player_version
    elsif input == "2"
      two_player_version
    end
  end
end
