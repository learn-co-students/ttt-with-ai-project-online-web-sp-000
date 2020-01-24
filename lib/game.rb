class Game

  attr_accessor :board, :player_1, :player_2

  # class constant for winning combinations
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

  # accepts 2 players and a board
  # defaults to two human players, X and O, with an empty board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @board.display
  end

  # returns the correct player, X, for the third move
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  # returns false for a draw
  # returns the correct winning combination in the case of a win
  def won?
    WIN_COMBINATIONS.find do |winning|
        board.cells[winning[0]] == board.cells[winning[1]] && board.cells[winning[1]] == board.cells[winning[2]] && board.cells[winning[0]] != " "
    end
  end

  # returns true for a draw; false for a won game
  # returns false for an in-progress game
  def draw?
    board.full? && !won? ? true : false
  end

  # returns true for a draw
  # returns true for a won game
  # returns false for an in-progress game
  def over?
    self.won? || self.draw?
  end

  # returns X when X won; returns O when O won; returns nil when no winner
  # won? returns [0, 4, 8]
  def winner
    if won?
      return board.cells[won?[0]]
    end
  end

  # makes a valid move
  # asks for input again after a failed validation
  # changes to player 2 after the first turn
  def turn
    selection = self.current_player.move(board)
    if @board.valid_move?(selection)
      @board.update(selection, current_player)
    else
      puts "Invalid move. Try again."
      self.turn
    end
  end

  # asks for players input on a turn of the game
  # checks if the game is over after every turn
  # checks if the game is won after every turn
  # checks if the game is a draw after every turn
  # stops playing if someone has won
  # plays the first turn of the game
  # plays the first few turns of the game
  # congratulates the winner X; congratulates the winner O
  # stops playing in a draw; prints "Cat\'s Game!" on a draw
  # plays through an entire game

  def play
    
  end

end
