module Players
  class Human < Player
    def move(board)
      puts "Enter 1-9"
      user_request = gets.strip
      user_request
    end
  end
end
