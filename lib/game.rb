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
       puts "Would you like to play again? (Y or N)"
       input = gets.strip
       until input == "Y" || input == "N"
         puts "Please enter either Y or N"
         input = gets.strip
       end
       if input == "Y"
         Game.start
       end
     else
       puts "Cat's Game!"
       puts "Would you like to play again? (Y or N)"
       input = gets.strip
       until input == "Y" || input == "N"
         puts "Please enter either Y or N"
         input = gets.strip
       end
       if input == "Y"
         Game.start
       end
     end
   else
     turn
     play
   end
  end

  def self.start
    puts "Hey what's up! Ready to play some Tic-tac-toe?"
    puts "What type of game would you like to play? (0, 1, or 2 players)"
    player_count = gets.strip
    until player_count == "0" || player_count == "1" || player_count == "2"
      puts "Please enter a number between 0-2"
      player_count = gets.strip
    end
    if player_count == "0"
      puts "Who should go 1st and get to play as X? (Computer1 or Computer2)"
      first_player = gets.strip
      until first_player == "Computer1" || first_player == "Computer2"
        puts "Please enter either Computer1 or Computer2"
        first_player = gets.strip
      end
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    elsif player_count == "1"
      puts "Who should go 1st and get to play as X? (Human or Computer)"
      first_player = gets.strip
      until first_player == "Human" || first_player == "Computer"
        puts "Please enter either Human or Computer"
        first_player = gets.strip
      end
      if first_player == "Human"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      else
        game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      end
    else
      puts "Who should go 1st and get to play as X? (Human1 or Human2)"
      first_player = gets.strip
      until first_player == "Human1" || first_player == "Human2"
        puts "Please enter either Human1 or Human2"
        first_player = gets.strip
      end
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
    end
    game.play
  end
end
