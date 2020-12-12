module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9:"
      input = gets.strip
    end

    def input_to_index(input)
      index = input.to_i
      index - 1
    end

  end
end
