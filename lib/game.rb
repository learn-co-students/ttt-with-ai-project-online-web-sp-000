class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  DEFAULT_BOARD = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  DEFAULT_P1 = Player::Human.new("X")
  DEFAULT_P2 = Player::Human.new("O")

  attr_accessor :player_1, :player_2

  def initialize(player_1 = DEFAULT_P1, player_2 = DEFAULT_P2, board = DEFAULT_BOARD )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board=(inputBoard)
    @board = inputBoard
  end

  def board
    @board
  end

end
