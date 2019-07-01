module Players
  class Human < Player
  
    def move(board)
     position = gets.chomp
     return position
    end
  end
end