module Players
  class Human < Player

      def move(board)
        # asks the player for input and returns it
        puts "Please enter your selection:"
        user_input = gets.strip
      end

  end
end
