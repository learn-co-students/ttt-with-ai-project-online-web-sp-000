module Players
  class Human < Player
    attr_reader :input

    def move(board)
      puts "Please enter a number 1-9:"
      @input = gets
    end

  end
end
