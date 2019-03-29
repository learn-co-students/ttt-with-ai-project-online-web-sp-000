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
    [6,4,2]
  ]

  def initialize(p_1 = Players::Human.new("X"), p_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = p_1
    self.player_2 = p_2
    self.board = board
    # binding.pry
  end

  def board
    @board
  end

  def current_player
      @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
      WIN_COMBINATIONS.find do |combo|
        # binding.pry
        @board.taken?(combo[0] + 1) && # +1  to undo index correction in board.position()
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]]
      end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    return @board.cells[won?[0]] if won?
  end

  def turn
    # binding.pry
    puts "Your move #{current_player.token}. Choose wisely!"
    puts "(Type \"reset\" at any time to violently turn the board over like a child)"
    move = current_player.move(@board)
    if move == "reset"
      @board.reset!
      system 'clear'
      @board.display
      turn
    end

    @board.valid_move?(move.to_i) ? @board.cells[move.to_i - 1] = current_player.token : turn
    system 'clear'
    @board.display
  end

  def play
    until over? || draw?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
