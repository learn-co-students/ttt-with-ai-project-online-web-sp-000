require "pry"

class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def initialize (player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X") || (self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O")
        return combo
      end
    end
    false
  end

  def draw?
    if self.board.full? && !won?
      true
    else
      false
    end
  end

  def over?
    self.board.full?
  end

  def winner
   winning_combo = won?
   if winning_combo == false
     nil
   else
     self.board.cells[winning_combo[0]]
   end
  end

  def turn
   value = current_player.move(self.board)
   if self.board.valid_move?(value)
     self.board.update(value, current_player)
   else
     turn
   end
  end

  def play
   self.board.display
   if over? || won? || draw?
     if won?
       puts "Congratulations #{winner}!"
     else
       puts "Cat's Game!"
     end
   else
     turn
     play
   end
  end

  def start
    puts "Hey what's up! Ready to play some Tic-tac-toe?"
    puts "What type of game would you like to play? (0, 1, or 2 players)"
    player_count = gets.strip
    puts "Who should go 1st and get to play as X? (Human or Computer)"
    first_player = gets.strip
    if player_count == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    elsif player_count == "1"
      if first_player == "Human"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      else
        game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      end
    else
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
    end
    game.play
  end
end
