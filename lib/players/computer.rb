module Players 
  class Computer < Player
    
     WIN_COMBINATIONS = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [7,5,3]
      ]
    
    def move(board)
      puts "The computer is making its move."
      # This condition needs to take precedence.  It should be a defense check, where it looks to see if two spaces in any winning combo are filled, then occupies the remaining space.
    
      moves_array = WIN_COMBINATIONS.reject{|combo| combo.none?{|index| board.taken?(index)}}
      moves_array_2 = moves_array.reject{|combo| combo.one?{|index| board.taken?(index)}}
      moves_array_3 = moves_array_2.reject{|combo| combo.all?{|index| board.taken?(index)}}
                   
      
      if moves_array_3.empty?
      
      
      #This move just finds the first open space in the set of winning combos.  It just programatically places tokens--first horizontally, in rows, then vertically, in columns, then diagonally, in diagons (i guess).
     
        moves_array_4 = WIN_COMBINATIONS.find{|combo| combo.find{|index| board.taken?(index) == false}}
        move_2 = moves_array_4.find{|index| board.taken?(index) == false}.to_s
          
        puts "The computer is moving to #{move_2}"
        move_2
      else
        moves_array_5 = moves_array_3[0].reject{|element| board.taken?(element)}
        move_1 = moves_array_5[0].to_s 
         
        puts "The computer is moving to #{move_1}"
        move_1
      end
   end  
  end
end