module Players
  class Human < Player
    attr_reader :input
    def move(board)
      puts "Please input a move 1-9:"
      @input = gets.chomp
    end
  end
end
