require_relative '../player'
module Players

  class Human < Player
    attr_accessor :game

    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end

  end

end
