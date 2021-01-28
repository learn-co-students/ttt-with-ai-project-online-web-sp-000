module Players
  class Computer < Player

    def move(board)
      case board.turn_count
      when 0
        "1" 
      when 1 
        "2"
      when 2
        "3"
      when 3 
        "4"
      when 4
        "5"
      when 5
        "6"
      when 6
        "7"
      when 7 
        "8"
      else 8 
        "9"
      end
     
    end
  end

end