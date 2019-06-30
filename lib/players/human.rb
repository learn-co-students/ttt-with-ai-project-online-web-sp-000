module Players
  class Human < Player
    def move(board)
      puts "Please select 1 - 9"
      user_move = gets.chomp
    end

   end
end