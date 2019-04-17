class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = 
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]
    
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if self.board.turn_count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end
  
  def won?
    win_array_x = WIN_COMBINATIONS.select do |combo|
      combo.all? do |position|
        self.board.cells[position] == "X"
      end
    end
    win_array_o = WIN_COMBINATIONS.select do |combo|
      combo.all? do |position|
        self.board.cells[position] == "O"
      end
    end
    if win_array_x[0]
      win_array_x[0]
    elsif win_array_o[0]
      win_array_o[0]
    else
      false
    end
  end
  
  def draw?
    if self.board.full? && !self.won?
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
      self.board.cells[self.won?[0]]
    else
      nil
    end
  end
  
  def turn
    board.display
    move = current_player.move(board)
    until board.valid_move?(move)
      puts "Invalid move. Please try again."
      move = current_player.move(board)
    end
    board.update(move, current_player)
  end
  
  def play
    until over?
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    else
      board.display
      puts "Cat's Game!"
    end
  end
end