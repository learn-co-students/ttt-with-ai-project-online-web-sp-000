class Players::Computer < Player
  
  def move(board)
    #binding.pry
    i = 1 
    valid_moves = []
    while i <= board.cells.length do 
      valid_moves << i.to_s if board.valid_move?(i.to_s)
      i += 1 
    end 
    valid_moves[rand(valid_moves.length)]
    #binding.pry
  end 
  
end 