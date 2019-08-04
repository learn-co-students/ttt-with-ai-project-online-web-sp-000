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
          elsif @first_move == "1"
          [6,8].sample.to_s
          elsif @first_move == "3"
          [4,8].sample.to_s
          elsif @first_move == "7"
          [2,6].sample.to_s
          else #if first_ move was "9"
          [6,8].sample.to_s
        end
            
           #when 3 Your second X should be placed on an edge, not a corner, unless you need to block your opponent from getting three in a row
           
           #when 4 
           #if move 2 was a corner and move three is a corner, Place your third X in the last empty corner. or if move two was an edge,If your opponent puts down an O in the corner that's not next to your X, you can use your third X to block their move and automatically win with your fourth X.
            
        else #choose a random free space
           random = rand(1..9).to_s
             until !board.taken?(random)
               random = rand(1..9).to_s
             end
             random
      end
    end
    end
  end

