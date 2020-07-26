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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def players_array
    [@player_1, @player_2]
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      self.players_array.any? do |player|
        combination.all? {|index| @board.position(index + 1) == player.token}
      end
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    @board.position(self.won?[0] + 1) if self.won?
  end

  def turn
    move = self.current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, self.current_player)
      @board.display
    else
      self.turn
    end
  end

  def play
    @board.display
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

end
