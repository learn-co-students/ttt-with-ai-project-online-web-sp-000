class Game
  attr_accessor :board, :player_1, :player_2, :winner
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @winner = nil
  end

  def current_player
    count = self.board.turn_count
    if count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      combo1 = combo[0]
      combo2 = combo[1]
      combo3 = combo[2]
      board1 = self.board.cells[combo1]
      board2 = self.board.cells[combo2]
      board3 = self.board.cells[combo3]
      if ((board1 == board2) && (board1 == board3)) && (board1.include?("X") || board1.include?("O"))
        self.winner = combo
      end
    end
    @winner
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    self.current_player.move(self.board)
    puts ""
    puts ""
    self.board.display
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
