module Players
  class Computer < Player
    # def move(board)
    #   board.cells.each do |slot|
    #     if slot[4] != " "
    #       return "5"
    #     else
    #       return "9"
    #     end
    #   end
    # end
    def move(board)
    if board.position("5") == " " then "5"
    else board.cells.each_with_index do |cell, index|
      if cell == " " then index+1
      end
    end
   end
  end
  end
end
