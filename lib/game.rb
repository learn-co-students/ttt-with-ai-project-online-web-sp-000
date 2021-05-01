class Game

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def play
    while !over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    player = current_player
    move = player.move(board)

    board.valid_move?(move) ? board.update(move, player) : turn
    board.display
  end

  def current_player
   board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      return combo if board.taken(combo[0]) && cells[combo[0]] == cells[combo[1]] && cells[combo[1]] == cells[combo[2]]
    end
  end

  def cells
    board.cells
  end

  def over?
    draw? || won?
  end

  def position_taken?(i)
    board.taken?(i)
  end

  def draw?
    board.full? && !won?
  end

  def winner
    w = won?
    if !w || w.length != 3
      return nil
    end

    i = w[1]
    cells[i]
  end

end
