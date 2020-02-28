class Game
  attr_accessor :board
  attr_reader :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,4,8], # left diagonal
    [2,4,6], # right diagonal
    [0,3,6], # left col
    [1,4,7], # middle col
    [2,5,8] # right col
  ]

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.odd? ? @player_2 : @player_1
  end

  def won?
    WIN_COMBINATIONS.find do |win_array|
      win_array.all? {|i| self.board.cells[i] == "X"} || win_array.all? {|i| self.board.cells[i] == "O"}
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    self.won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.gets
    # self.board.valid_move?(input)
    if self.board.valid_move?(input)
      move(index, current_player)
      display_board
    else
      turn
    end

  end

end
