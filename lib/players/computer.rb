#Players::Computer inherits from Player

module Players
  
  class Computer < Player
    
    def move (board)
      #move returns a valid position for the computer to move
      #move = "5"
      #until !board.taken?(move)
        #move = rand(1..9).to_s
      #end
      #move
      if !board.taken?("5")
        move = "5"
        elsif !board.taken?("1")
        move = "1"
        elsif !board.taken?("3")
        move = "3"
        elsif !board.taken?("7")
        move = "7"
        elsif !board.taken?("9")
        move = "9"
      else
        move = rand(1..9).to_s until !board.taken?(move)
      end
      move
    end
    
  end
  
end