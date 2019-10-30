class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], 
    [6,7,8], [0,3,6], 
    [1,4,7], [2,5,8],
    [0,4,8], [6,4,2]
  ]

  def initialize(player_1 =  Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end
  
  def won?
    cells = @board.cells
    WIN_COMBINATIONS.detect do |item|
      cells[item[0]] != " " && cells[item[0]] == cells[item[1]] && cells[item[1]] == cells[item[2]]
    end
  end

  def draw?
    board.full? && !self.won?
  end
  
  def over?
    self.draw? || self.won?
  end
  
  def winner
    combo = self.won?
    @board.cells[combo[0]] if combo
  end
  
  def turn
    curr_player = self.current_player
    move = "-1"
    until @board.valid_move?(move)
      move = curr_player.move(@board)
    end
    @board.update(move, curr_player)
  end
  
  def play
    until self.over?
      @display.display
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end