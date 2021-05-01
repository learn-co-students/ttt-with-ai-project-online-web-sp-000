
class Game 
  
  attr_accessor:board, :player_1, :player_2, :current_player
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
    
    
    def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new) 
      self.player_1 = player_1
      self.player_2 = player_2
      self.board = board 
    end 
    
    def current_player
      if self.board.turn_count.even? 
        self.current_player = self.player_1
      
      else 
         self.current_player = self.player_2
      end 
      
    end 
    
    
    
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
  end
  end 
  
  def draw? 
    (!won?&&self.board.full?) || false
  end 
  
  def over?
    won? || draw? 
  end 
  
  def winner
    if won? 
    w = won? 
    self.board.cells[w[0]]
  else 
    nil 
  end 
  end 
  
  def turn
    
    m =  self.current_player.move(self.board)
    if !self.board.valid_move?(m) 
     turn
    end 
    self.board.update(m,self.current_player)

 end 
 
 def play
   while !over?
   turn
   end 
   
   if winner 
     puts "Congratulations #{winner}!"
   else 
     puts "Cat's Game!"
   end 
   
 end 
      


  

    
    
end 