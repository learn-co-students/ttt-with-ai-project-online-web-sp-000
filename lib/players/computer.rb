require 'pry'
module Players
  class Computer < Player
    
     WIN_COMBINATIONS = [
     [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  
    
   def move(board)
     x_count = 0
     o_count = 0
     WIN_COMBINATIONS.each do |win_combination|
       win_combination.each do |cell|
         arr = []
         if board.cells[cell] == "O"
           o_count += 1
          elsif board.cells[cell] == "X"
           x_count += 1
         end
        if x_count = 2 || o_count = 2
          binding.pry
          #find empty cell 
          win_combination.index(" ").first
        end
      end
     end     
          
      in_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
          
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
          
     #     @board.cells[win_index_1]
     #loop over array of win combinations
     #if win 2/3 combinations have same token
     #add computer's token
     
     
     
    # index = rand(1..9)
     #if !board.taken?(index)
      # move = index.to_s
   end
end
end