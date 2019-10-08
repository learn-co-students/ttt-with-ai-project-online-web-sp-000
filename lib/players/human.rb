module Players
  
  class Human < Player
    def move(board)
      input = gets.chomp
      p "#{input}"
    end
  end
end