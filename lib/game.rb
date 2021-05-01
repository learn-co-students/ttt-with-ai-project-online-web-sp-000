class Game
  
  attr_accessor :board, :player_1, :player_2
  
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
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    
  end
  
  def current_player
    
    players = [@player_1, @player_2]
    
    #binding.pry
    
    @board.turn_count.even? ? players.select{|player| player.token == "X"}[0] : players.select{|player| player.token == "O"}[0]
    
  end
  
  def won?
    
    WIN_COMBINATIONS.each do |index_array|
      if ((@board.cells[index_array[0]] == @board.cells[index_array[1]]) && (@board.cells[index_array[1]] == @board.cells[index_array[2]]) && (@board.cells[index_array[1]] == "X" || @board.cells[index_array[1]] == "O"))
        return index_array
      end
    end
    return false
    
  end
  
  def draw?
    
    @board.full? && !won?
  
  end
  
  def winner
  
    if(won?)
      return @board.cells[(won?[0])]
    end
    
  end
  
  def over?
    
    draw? || won?
    
  end
  
  def turn 
    
    current_player.move(board)
    @board.display
    
  end
  
  def play 
    
    while(!over?) do
      puts "==========="
      turn
      
    end
    
    puts "Congratulations #{winner}!" if won? 
    puts "Cat's Game!" if draw? 
    
  end
  
end


