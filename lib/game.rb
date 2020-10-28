require_relative '../lib/players/computer'
require_relative '../lib/players/human'
class Game
  extend Players
  attr_accessor :board, :player_1, :player_2, :players

  WIN_COMBINATIONS = [
  [0, 1, 2],  #Top row
  [3, 4, 5],  #Middle row
  [6, 7, 8],  #Bottom row
  [0, 3, 6],  #Left row
  [1, 4, 7],  #Middle row
  [2, 5, 8],  #Right row
  [0, 4, 8],  #Left diagonal
  [2, 4, 6]   #Right diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def current_player
    @board.turn_count % 2 == 0? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
     @board.cells[winner[0]] == @board.cells[winner[1]] &&
     @board.cells[winner[1]] == @board.cells[winner[2]] &&
     (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
  end

def draw?
  !won? && @board.full?
end

def over?
  draw? || won?
end

def winner
  if winning_combo = won?
    @winner = @board.cells[winning_combo.first]
  end
end

def turn
  puts "It's #{self.current_player.token}'s turn."
  input = self.current_player.move(board)
  if @board.valid_move?(input)
    @board.update(input, current_player)
  else
    puts "This move is not valid. Please enter a new selection."
    @board.display
    turn
  end
end

def play
  until over?
    @board.display
    turn
  end
   if won?
     winner == "X" || winner == "O"
     puts "Congratulations #{winner}!"
     @board.display
   else
     draw?
       puts "Cat's Game!"
       @board.display
     end
   end

   def self.start
     puts "Welcome to Tic Tac Toe!"
     puts "What would you like to play? Select game mode: Computer, 1 player, or 2 player."
     input = gets.strip

     case input

     when "Computer"
         Game.new(@player_1 = Players::Computer.new("X"), @player_2 = Players::Computer.new("O")).play

      when  "1 player"
         Game.new(@player_1 = Players::Human.new("X"), @player_2 = Players::Computer.new("O")).play

      when "2 player"
              Game.new.play

     else puts "Invalid entry. Select game mode: Computer, 1 player, or 2 player."
         self.start
      end

    puts "Would you like to play again? Y/N"
    input = gets.strip
    if input == "Y"
      self.start
    end

   end


end
