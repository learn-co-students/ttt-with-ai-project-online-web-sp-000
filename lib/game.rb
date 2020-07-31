class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [3,4,5],
    [6,7,8]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  
  def current_player
    if board.turn_count % 2 == 0 
      @player_1 
    else 
      @player_2 
    end 
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
    position = []
      combination.each do |index|
        position << board.cells[index]
      end 
      
      if position.all?{|token| token == "X"} || position.all?{|token| token == "O"}
        return combination
      else
        false
      end
    end
    false
  end
            
  def draw?
    if board.full? && !won?
      return true 
    end 
    false
  end 
  
  def over?
    if draw? || won?
      return true
    end 
    false
  end 
  
  def winner 
    if won?
      return board.cells[won?[0]]
    end 
  end 
  
  def turn
    board.display
    puts "#{current_player.token}, make your move (1 - 9)."
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      input = current_player.move(board)
    end
  end
    
    
  def play
    until over? do
      turn
    end
    if draw?
      board.display
      puts "Cat's Game!"
      return true
    elsif won?
      board.display
      puts "Congratulations #{winner}!" 
      return true
    end
  end
  
end 
