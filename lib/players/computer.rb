require "pry"
module Players
  class Computer < Player
   
    #Too easy, computer has no strategy, just choosing randomly
    #def move (board)
    # rand(1..9).to_s
    #end
    
   
    
    def move(board)
     
    case board.turn_count
        when 0 #if player 1, on 1st turn always try go in a corner
          [1,3,7,9].sample.to_s
        
        when 1 #if player 2, if player 1 has taken a corner on first move, choose the centre, otherwise choose randomly
        if [1,3,7,9].any?{|corner| board.taken?(corner)}
         "5"
         end
        
        when 2 #if player 1, on 2nd turn try to go in the centre, otherwise choose somewhere random
          if board.taken?(5)
            rand(1..9).to_s
          else "5"
          end
        
        else #choose a random space
          rand(1..9).to_s
      end
    end
    
  end
   
   
    #if other player has two in a row pick the third one
    
end

