module Players
  class Human < Player

    attr_reader :cells, :token, :board

    def move(board)
    #  binding.pry
    puts "Please enter 1-9:"
    user_input = gets.strip
    #.to_i
    user_input
    end

  end
end
