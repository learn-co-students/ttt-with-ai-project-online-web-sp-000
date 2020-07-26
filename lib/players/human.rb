class Players::Human < Player
  
  def move(board)
    user_input = gets.strip
    #board.cells.include?(user_input.to_i) ? user_input : self.move(board)
  end 
  
end 