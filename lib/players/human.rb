require_relative '../player'
module Players
  class Human < Player
    def move(board)
      board.display
      puts "Please enter 1-9:"
      input = gets.strip
    end
  end
end
