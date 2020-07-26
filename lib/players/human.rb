module Players

  class Human < Player

    def move(board)
      puts "Where do you want to play?"
      user_input = gets.strip
      user_input
    end

  end

end
