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
    index = rand(1..9)
     if !board.taken?(index)
      move = index.to_s
  end
end
end
end

#   def move(board)
#     ai_move = nil
#     WIN_COMBINATIONS.each do |win_combination|
#       win_index_1 = win_combination[0]
#       win_index_2 = win_combination[1]
#       win_index_3 = win_combination[2]
          
#       position_1 = board.cells[win_index_1]
#       position_2 = board.cells[win_index_2]
#       position_3 = board.cells[win_index_3]
      
#       if position_1 == "X" && position_2 == "X" 
#         puts "computer moved to #{win_index_3} to win the game"
#         return ai_move = win_index_3.to_s if board.valid_move?(win_index_3.to_s)
#       elsif position_2 == "X" && position_3 == "X" 
#         puts "computer moved to #{win_index_1} to win the game"
#         return ai_move = win_index_1.to_s if board.valid_move?(win_index_1.to_s)
#       elsif position_1 == "X" && position_3 == "X"
#         puts "computer moved to #{win_index_2} to win the game"
#         return ai_move = win_index_2.to_s if board.valid_move?(win_index_2.to_s)
#       elsif position_1 == "O" && position_2 == "O" 
#         puts "computer moved to #{win_index_3} to win the game"
#         return ai_move = win_index_3.to_s if board.valid_move?(win_index_3.to_s)
#       elsif position_2 == "O" && position_3 == "O"
#         puts "computer moved to #{win_index_1} to win the game"
#         return ai_move = win_index_1.to_s if board.valid_move?(win_index_1.to_s)
#       elsif position_1 == "O" && position_3 == "O"
#         puts "computer moved to #{win_index_2} to win the game"
#         return ai_move = win_index_2.to_s if board.valid_move?(win_index_2.to_s)
#       end
#     end
#         until ai_move != nil && !board.taken?(ai_move) 
#           ai_move = rand(1..9)
#         end
#     ai_move.to_s
#   end
        
# end
# end
        
      
          
