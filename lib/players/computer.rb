module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0, 1, 2], #Top row
      [3, 4, 5], #Middle row
      [6, 7, 8], #Bottom row
      [0, 3, 6], #First Column
      [1, 4, 7], #Second Column
      [2, 5, 8], #Third Column
      [0, 4, 8], #Diagonal left to right
      [2, 4, 6], #Diagonal right to left
    ]
    def move(board)
      if board.cells.count{|position| position != " " } == 0
        "1"
      elsif board.cells.count{|position| position != " " } == 1
        board.cells.find_index("X") == 5 ? "1" : "7"
      else    
        if board.cells.count{|position| position != " " } >= 4
          move = ""
          available_moves = []
          available_moves_ints = []
          board.cells.map.with_index(1) do |position, index| 
            if position == " " 
              available_moves << index.to_s
              available_moves_ints << index
            end
          end   

          available_moves_ints.each do |move_option|
            WIN_COMBINATIONS.each do |winning_combo| 
              if winning_combo.include?(move_option)
                make_move_array = winning_combo.reject{|e| e == move_option}
                if board.cells[make_move_array[0]] == board.cells[make_move_array[1]] && board.cells[make_move_array[0]] == self.token
                 move = move_option.to_s
                end
              end
            end
          end

          if move == ""
            available_moves.sample
          else               
            move      
          end
          
        else
          available_moves = []
          board.cells.map.with_index(1) do |position, index| 
            if position == " " 
              available_moves << index.to_s
            end
          end                   
          
          available_moves.sample          
        end     
      end
    end
  end
end

# no strategy
# module Players 
#   class Computer < Player
#     def move(board)
#       output = (1..9).to_a.sample.to_s
#     end
#   end
# end

# Basic Strategy
# module Players
#   class Computer < Player
#     def move(board)
#       if board.cells.count{|position| position != " " } == 0
#         "1"
#       elsif board.cells.count{|position| position != " " } == 1
#         board.cells.find_index("X") == 4 ? "0" : "5"   
#       else
#         available_moves = []
#         board.cells.map.with_index(1) do |position, index| 
#           if position == " " 
#             available_moves << index.to_s
#           end
#         end                   
#         available_moves.sample  
#       end
#     end
#   end
# end