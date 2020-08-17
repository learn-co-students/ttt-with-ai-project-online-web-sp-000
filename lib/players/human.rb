# Now when you call your Human class, you'll have to 
# call it inside its name space with Players::Human

module Players
  class Human < Player
    
    def move(board="")
      board = gets.strip
    end

  end
end