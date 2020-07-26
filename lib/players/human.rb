require_relative "../player.rb"

module Players
  class Human < Player
    def move(board)
      board.display
      puts "Show your moves. Pick 1-9"
      gets.chomp
    end
  end
end
