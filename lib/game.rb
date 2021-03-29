require "pry"

class Game
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    turn = @board.turn_count % 2
    
    if turn == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    @win = WIN_COMBINATIONS.select do |combo|
      (@board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X") || (@board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O")
    end
    
    @win[0]
  end
  

  def draw?
    if won?
      return false
    end
    
    if @board.full?
      true
    else 
      false
    end
  end
  
  def over?
    if draw?
      return true
    end
    
    if won?
      return true
    end
  end
  
  def winner
    if won?
      @board.cells[@win.sample.sample]
    end
  end
  
  def turn
    current_player.move(@board)
  end
  
  def start
    puts "Welcome to CLI TIC-TAC-TOE"
    puts "How many players do you want to play (0,1,or 2):"
    num_players = gets.strip
    
    if num_players == "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    end
    
    if num_players == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    end
    
    if num_players == "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    end
      
    play
  end
  
  def play
    while !over?
      turn
      @board.display
      puts ""
    end
    
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
      
  end
    

end