module Players
  class Human < Player
    def move(board)
      puts "What would you like your move to be? (1-9)"
      user_input = gets.chomp
    end
  end
end
