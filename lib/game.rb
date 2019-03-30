class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1, @player_2, @board = player_1, player_2, board
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0])
    end
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def start
    puts "Welcome to Tic-Tac-Toe!"
    puts "How many Human Players will be playing? (0,1,2)"
    while (0..2).none?(human_players)
      human_players = gets.chomp.to_i
    end
    puts "Who should go first? (1, 2)"
    while (1..2).none?(first)
      first = gets.chomp.to_i
    end

  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    puts 'Please enter 1-9:'
    user_input = gets.strip
    index = @board.input_to_index(user_input)
    if @board.valid_move?(index)
      move(index, current_player.token)
      @board.display_board
    else
      turn
    end
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def move(index, player = "X")
    @board.cells[index] = player
  end
end
