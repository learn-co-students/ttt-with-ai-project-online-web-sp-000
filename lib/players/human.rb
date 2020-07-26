module Players
    class Human < Player
    def move(board)
      puts "Please input the location to place your token"
      input = gets.chomp
      input
    end
  end
end
