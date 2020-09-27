module Players 
  #here we have an overriding module class Players that wraps around the entire class, and then:
  class Human < Player  
    #this 'class Human' inherits all of the functionality from the Player module that we have 
    def move(board)
      puts "Please enter your input selection"
      gets.strip      
      # whenever you do a gets it's alwasy a good idea to do a .strip as well because you never know if someone's gonna enter the input with extra characters  
    end 
  end 
end 