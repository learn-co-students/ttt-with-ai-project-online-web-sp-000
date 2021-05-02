module Players
  class Human < Player
 def move(board)
    puts "Please pick where you want to move."
    gets.strip
    end
  end
end
