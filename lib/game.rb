require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @board.display
  end
  
  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
    if @board.cells[0] == "X" && @board.cells[1] == "X" && @board.cells[2] == "X" || @board.cells[0] == "O" && @board.cells[1] == "O" && @board.cells[2] == "O"
      return WIN_COMBINATIONS[0]
    elsif @board.cells[3] == "X" && @board.cells[4] == "X" && @board.cells[5] == "X" || @board.cells[3] == "O" && @board.cells[4] == "O" && @board.cells[5] == "O"
      return WIN_COMBINATIONS[1]
    elsif @board.cells[6] == "X" && @board.cells[7] == "X" && @board.cells[8] == "X" || @board.cells[6] == "O" && @board.cells[7] == "O" && @board.cells[8] == "O"
      return WIN_COMBINATIONS[2]
    elsif @board.cells[0] == "X" && @board.cells[3] == "X" && @board.cells[6] == "X" || @board.cells[0] == "O" && @board.cells[3] == "O" && @board.cells[6] == "O"
      return WIN_COMBINATIONS[3]
    elsif @board.cells[1] == "X" && @board.cells[4] == "X" && @board.cells[7] == "X" || @board.cells[1] == "O" && @board.cells[4] == "O" && @board.cells[7] == "O"
      return WIN_COMBINATIONS[4]
    elsif @board.cells[2] == "X" && @board.cells[5] == "X" && @board.cells[8] == "X" || @board.cells[2] == "O" && @board.cells[5] == "O" && @board.cells[8] == "O"
      return WIN_COMBINATIONS[5]
    elsif @board.cells[0] == "X" && @board.cells[4] == "X" && @board.cells[8] == "X" || @board.cells[0] == "O" && @board.cells[4] == "O" && @board.cells[8] == "O"
      return WIN_COMBINATIONS[6]
    elsif @board.cells[2] == "X" && @board.cells[4] == "X" && @board.cells[6] == "X" || @board.cells[2] == "O" && @board.cells[4] == "O" && @board.cells[6] == "O"
      return WIN_COMBINATIONS[7]
    else
      return false
    end
  end
  
  def draw?
    if @board.full? == true && won? == false
      true
    elsif @board.full? == false && won? == true
      false
    else
      false
    end
  end
  
  def over?
    if draw? == true || won? != false
      true
    elsif draw? == false && won? == false
      false
    end
  end
  
  def winner
    if won? == false
      nil
    else
      if @board.cells[won?[0]] == player_1.token
        player_1.token
      elsif @board.cells[won?[0]] == player_2.token
        player_2.token
      end
    end
  end
  
  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move) == true
      @board.update(move, current_player)
      @board.display
    else
      @board.display
      turn
    end
  end
  

  def play
    until over? == true
      turn
    end
    
    if won? != false
      puts "Congratulations #{winner}!"
      restart?
    elsif draw? == true
      puts "Cat's Game!"
      restart?
    end
  end
    
  def restart?
    puts "Would you like to play again? [y/n]"
    input = gets.chomp
    if input == "y"
      Game.start
    end
  end
  
  def self.start
    puts "Hello, and welcome to Tic Tac Toe!"
    puts "How many Players? (0, 1 or 2)"
    
    input = gets.chomp
    
    if input == "1" || input == "2"
      puts "Which player will go first and be X (1, or 2)"
        input_2 = gets.chomp
        if input == "1" && input_2 == "1"
          Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
        elsif input == "1" && input_2 == "2"
          Game.new(Players::Human.new("O"), Players::Computer.new("X"), Board.new).play
        elsif input == "2"
          Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
          
        end
    end
    
    if input == "0"
      puts "Starting automated game"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    end
  end
end