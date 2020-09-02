module Players
  class Computer < Player

    def move(inputBoard)
      passing = false
      while !(passing)
        randInput = gets.strip
        if (inputBoard.valid_move?(ui))
          passing = true
        end
      end
      #.pry
      return ui
    end


  end
end
