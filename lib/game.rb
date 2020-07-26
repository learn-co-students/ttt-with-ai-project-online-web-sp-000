class Game 
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  
  attr_accessor :player_1, :player_2, :board

  def initialize(p1 = Players::Human.new('X'), p2 = Players::Human.new('O'), board = Board.new)
    @player_1 = p1 
    @player_2 = p2 
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
      if @board.position_taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        return combo
      end
    end
    
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    combo = won?
    combo ? @board.cells[combo[0]] : nil
  end
  
  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      turn
    end
  end
    
  def play
    until over?
      @board.display
      puts "\n\n"
      turn
    end
    @board.display
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end

