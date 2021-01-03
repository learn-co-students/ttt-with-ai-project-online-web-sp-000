require 'pry'
module Players

  class Human < Player

    # def initialize


    def move(board = Board.new)
      puts "Player #{self.token}, Please enter move 1-9 location:"
      player_input = gets
      player_input
    end
  end

end
