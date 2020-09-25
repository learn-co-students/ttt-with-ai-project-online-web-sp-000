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
    [2,4,6]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end
  
  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end
  
  def won?
    WIN_COMBINATIONS.find do |combination|
      combination.all? {|index|self.board.cells[index] == "X"} || combination.all? {|index|self.board.cells[index] == "O"}
    end
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
    puts "Please enter 1-9 (top row = 123):"
    cell = self.current_player.move(self.board)
    if self.board.valid_move?(cell)
       self.board.update(cell, self.current_player)
       self.board.display
    else
       puts "Invalid move"
       turn
    end
  end

  def play
    puts "Let's play!"
    self.board.display
    until self.over?
      self.turn
    end
    if self.won?
      # could add logic here so that the message is "You win!" or "You lose!" for one-player games
      
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end