require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2
  
  @@all = []
  
  def self.all
    @@all
  end
  
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
  
  def self.wins
    WIN_COMBINATIONS
  end
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    # Game.all << self
  end
  
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    Game.wins.find do |combo|
      x = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      x[0] == "X" || x[0] == "O" if x.uniq.count == 1
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    board.position(won?[0] + 1) if won?
  end
  
  def turn
    x = current_player.move(board)
    if !board.valid_move?(x)
      turn
    else
      board.update(x, current_player)
      board.display
    end
  end
  
  def play
    while !over?
      turn
      puts ""
    end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

end