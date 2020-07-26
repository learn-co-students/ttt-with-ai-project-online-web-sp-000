module Players
  class Human < Player

    # attr_reader :cells, :token, :board

    def input_to_index(input)
      input.to_i - 1
    end

    def move(board)
    # binding.pry
    puts "Please enter 1-9:"
    user_input = gets.strip
    user_input
   #answer = input_to_index(user_input)

    end

  end
end
