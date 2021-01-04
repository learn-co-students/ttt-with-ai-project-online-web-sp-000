class Game

  WIN_COMBINATIONS = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board.reset!
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    turn_count % 2 == 0 ? "O" : "X"
  end

  def won?

  end

  def draw?

  end

  def winner

  end

  def turn

  end

  def play

  end
end
