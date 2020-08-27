module Players
  class Computer < Player

    def move(board)
      #iterate thru the board instance and see what it has as empty
      stillempty = []
      board.cells.each_with_index do | cell, index |
        if cell == " " || cell == ""
          stillempty << (index + 1).to_s
          #ex: if cell is not empty, we add index+1. if index 4, we add 5 to the stillempty array. that means slot 5 still avialble
        end
      end
      stillempty.sample() #randomly choose an item from array to return

    end

  end #end class



end #end module
