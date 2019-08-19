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
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

   def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

   def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells.values_at(combo[0], combo[1], combo[2]) == ["X", "X", "X"]  || self.board.cells.values_at(combo[0], combo[1], combo[2]) == ["O", "O", "O"]
    end
  end

   def draw?
    won? || self.board.turn_count < 9 ? false : true
  end

   def over?
    won? || draw? ? true : false
  end

   def winner
    return self.board.cells[won?[0]] if won?
  end

   def turn
    puts "Please enter 1-9 for your move."
    input = current_player.move(self.board)
    self.board.valid_move?(input) ? self.board.update(input, current_player) : turn
    puts "You chose #{input}."
  end

   def play
    while !over?
      turn
      self.board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

 end 