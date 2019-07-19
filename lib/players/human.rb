module Players                      #define module Players
  class Human < Player              #Human inherits from Player class. Used nested module NAMESPACING here for Human inside modules Players
    def move(board)                 #asks the user for input and returns it
      puts "Please enter 1-9:"
      gets.chomp
    end
  end
end

#Now when calling Human class, you'll have to call it inside its name space with Players::Human
