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
    [2, 4, 6]]

  def current_player
    turn = self.board.turn_count
    if turn % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    winning_combo = false
    
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
    
      pos_1 = @board.cells[win_index_1]
      pos_2 = @board.cells[win_index_2]
      pos_3 = @board.cells[win_index_3]
    
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        winning_combo = win_combo
      end
    end
    winning_combo
  end

  def full?
    index = 0
    @board.cells.all? do |idx|
      index += 1
      board.taken?(index)
    end
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    combo = won?
    if combo
      @board.cells[combo[0]]
    else
      nil
    end
  end

  def turn
    current_player.move(self.board)
  end

  def play
    until over?
      self.turn
    end

    if won?
      winner = self.winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end