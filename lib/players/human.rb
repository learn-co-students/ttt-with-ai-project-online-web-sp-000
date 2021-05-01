module Players  
  class Human < Player
    def move(x)
      x = gets.chomp
      return x
    end
  end
end