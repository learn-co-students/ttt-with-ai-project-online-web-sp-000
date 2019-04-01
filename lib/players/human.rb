require 'pry'
module Players

  class Human < Player

    def move(board)
      "Please enter 1-9:"
      gets.chomp
    end
  end



end
