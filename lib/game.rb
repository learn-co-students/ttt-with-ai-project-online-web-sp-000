class Game

  attr_accessor :board, :player_1, :player_2 #provides access to player_1, player_2, and board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
#runs over WIN_COMBINATIONS to check board cells for a winning combo, where winning combo includes all X's or all O's (no blanks)
    WIN_COMBINATIONS.detect {|win| @board.cells[win[0]] != " " && @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]]}
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
                #returns X when X won
                #returns O when O won --> if self.won? is true, it returns the winning combination so I'm looking at the index to pull the value at that winning index ( => "X" or "O")
                #returns nil when no winner --> if self.won? is falsey, then it will return nil
    self.won? ? @board.cells[self.won?[0]] : nil
  end

  def turn
    self.board.turn_count.even? ? player = "player_1" : player = "player_2"

    input = self.send(player).move(self.board)

    self.board.valid_move?(input) ? self.board.update(input, send(player)) : input = self.send(player).move(self.board)
  end

  def play

    until self.over?
      self.turn
      self.board.display
    end


    if self.draw?
      puts "Cat's Game!"
    elsif self.won?
      puts "Congratulations #{self.winner}!"
    end
  end

end
