module Players
  class Human < Player
    attr_accessor :board
    
    def move(board)
      puts "Enter a number 1-9: "
      input = gets.strip
    end
  end
end