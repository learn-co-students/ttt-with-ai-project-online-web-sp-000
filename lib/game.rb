class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), given_board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = given_board
  end

  def current_player
    turn = @board.turn_count
    if turn == 0 || turn.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        win = combo
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        win = combo
      end
    end
    win
  end

  def draw?
    if @board.full? && !self.won?
      true
    else
      false
    end
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def winner
    if self.won?
      win_combo = self.won?
      @board.cells[win_combo[0]]
    end
  end

  def turn
    input = self.current_player.move(@board)
    unless @board.valid_move?(input)
      input = self.current_player.move(@board)
    end
      @board.update(input, self.current_player)
  end

  def play
    until self.over?
      puts "Turn: #{@board.turn_count}"
      @board.display
      self.turn
    end
    if winner == "X"
      puts "Turn: #{@board.turn_count}"
      @board.display
      puts "Congratulations X!"

    elsif winner == "O"
      puts "Turn: #{@board.turn_count}"
      @board.display
      puts "Congratulations O!"

    else
      puts "Turn: #{@board.turn_count}"
      @board.display
      puts "Cat's Game!"

    end
  end
end
