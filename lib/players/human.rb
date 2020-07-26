require 'pry'

module Players

  class Human < Player

    def move(board)
      #binding.pry
      input = gets.strip
      return input
    end

  end
end
