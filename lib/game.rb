class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,4,6],
  [2,5,8]
  
  ]
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2 
    @board = board
  end 
  
  def current_player
    xx = @board.turn_count 
    if xx.even? 
      @player_1
    else 
      @player_2
    end
  end 
  
  def won?
   WIN_COMBINATIONS.each do |combo|
   if @board.cells[combo[0]] == @board.cells[combo[1]] &&
          @board.cells[combo[1]] == @board.cells[combo[2]] &&
          @board.taken?(combo[0]+1)
          return combo 
      end 
    end 
     return false 
  end 
  
  def draw?
    if @board.full? && self.won? == false 
      true 
    else 
      false 
    end 
  end
  
  def over?
    if self.draw? || self.won?
      true 
    else 
      false 
    end
  end 
  
  def winner
    if won?
      combo = won?
      @board.cells[combo[0]]
    end 
  end 
  
  def play 
    turn until over? 
    if won? 
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end 
  end 
  
  def turn 
    puts "Please enter a number 1-9:"
    @board.display
    input = current_player.move(@board) 
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else 
      puts "That move is not valid."
      @board.display
      turn
    end
    @board.display 
    end 
  
  
  
end 