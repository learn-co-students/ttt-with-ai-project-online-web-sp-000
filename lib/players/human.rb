require_relative '../player.rb' #require relative where the parent class is coming from

module Players
  class Human < Player

    def move(board)
      puts "Please make a move! (1-9)"
      input = gets.to_str
      return input
    end

  end
end
