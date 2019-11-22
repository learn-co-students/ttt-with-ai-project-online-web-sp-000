require_relative "../player.rb"

module Players
  class Human < Player
    def move(board)
      board.display
      puts "Enter your next move, please pick from 1-9."
      gets.strip
    end
  end
end