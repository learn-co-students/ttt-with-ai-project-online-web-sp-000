module Players
  class Human < Player

    def move(inputBoard)
      passing = false
      while !(passing)
        puts "Enter a space 1-9"
        ui = gets.strip
        if (inputBoard.valid_move?(ui))
          passing = true
        end
      end
      #.pry
      return ui
    end


  end
end
