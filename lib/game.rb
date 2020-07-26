class Game

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [ 2, 5, 8], [0, 4, 8], [2, 4, 6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect { |win_combo| win_combo.all? { |c_ind| self.board.cells[c_ind] == "X"} || win_combo.all? { |c_ind| self.board.cells[c_ind] == "O"}}
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    self.won? ? self.board.cells[self.won?[0]] : nil
  end

  def turn
    self.board.display
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      # self.board.display
    else
      self.turn
    end
  end

  def play
    self.turn until self.over?
    if self.won?
      self.board.display
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
