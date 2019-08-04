require "pry"
module Players
  class Computer < Player
   
    #Too easy, computer has no strategy, just choosing randomly
    #def move (board)
    # rand(1..9).to_s
    #end
    
   
    
    def move(board)
     
    case board.turn_count
        when 0 #if computer is player 1, on 1st turn always try go in a corner
          @first_move = [1,3,7,9].sample.to_s
        
        when 1 #if computer is player 2, if player 1 has taken a corner on first move, choose the centre, or if centre has been taken, choose a corner otherwise choose randomly from free spaces
          if [1,3,7,9].any?{|corner| board.taken?(corner)}
          "5"
          elsif
          board.taken?(5)
          [1,3,7,9].sample.to_s
          else 
             random = rand(1..9).to_s
             until !board.taken?(random)
               random = rand(1..9).to_s
             end
             random
       end
          
          when 2 # if opponent plays first 0 in center, choose diagonally opposite space to your first move. if they didnt chose center, place your X on an edge square (not a corner), not touching your first X.
          if board.taken?(5) && @first_move == "1"
              "9"
          elsif board.taken?(5) && @first_move == "3"
              "7"
          elsif board.taken?(5) && @first_move == "7"
              "3"
          elsif board.taken?(5) && @first_move == "9"
              "1"
          else
             choice = [2,4,6,8].sample.to_s #needs amending so its not touching first move
             until !board.taken?(choice)
             choice = [2,4,6,8].sample.to_s
            end
            choice
          end
            
        
        else #choose a random free space
           random = rand(1..9).to_s
             until !board.taken?(random)
               random = rand(1..9).to_s
             end
             random
      end
    end
    
  end
   
   
    #if other player has two in a row pick the third one
    
end

