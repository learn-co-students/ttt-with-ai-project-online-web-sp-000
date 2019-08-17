#Game ::WIN_COMBINATIONS defines a constant WIN_COMBINATIONS with arrays for each win combination

class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # \ diagonal
    [2, 4, 6] # / diagonal
    ]
  
  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    #initialize accepts 2 players and a board
    #initialize defaults to two human players, X and O, with an empty board
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end
  
  def current_player
    #current_player returns the correct player, X, for the third move
    self.board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    #won? returns false for a draw
    #won? returns the correct winning combination in the case of a win
    #won? isn't hard-coded
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells.values_at(combo[0], combo[1], combo[2]) == ["X", "X", "X"]  || self.board.cells.values_at(combo[0], combo[1], combo[2]) == ["O", "O", "O"]
    end
  end
  
  def draw?
    #draw? returns true for a draw
    #draw? returns false for a won game
    #draw? returns false for an in-progress game
    won? || self.board.turn_count < 9 ? false : true
  end
  
  def over?
    #over? returns true for a draw
    #over? returns true for a won game
    #over? returns false for an in-progress game
    won? || draw? ? true : false
  end
  
  def winner
    #winner returns X when X won
    #winner returns O when O won
    #winner returns nil when no winner
    return self.board.cells[won?[0]] if won?
  end
  
  def turn
    #turn makes valid moves
    #turn asks for input again after a failed validation
    #turn changes to player 2 after the first turn
    puts "Please enter 1-9 for your move."
    input = current_player.move(self.board)
    self.board.valid_move?(input) ? self.board.update(input, current_player) : turn
    puts "You chose #{input}."
  end
  
  def play
    #play asks for players input on a turn of the game
    #play checks if the game is over after every turn
    #play plays the first turn of the game
    #play plays the first few turns of the game
    #play checks if the game is won after every turn
    #play checks if the game is a draw after every turn
    #play stops playing if someone has won
    #play congratulates the winner X
    #play congratulates the winner O
    #play stops playing in a draw
    #play prints "Cat's Game!" on a draw
    #Game play plays through an entire game
    while !over?
      turn
      self.board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

end