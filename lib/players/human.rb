#class Human that inherits from Player

module Players
  class Human < Player

    def move(board) #implement a move method that takes in a board.
      input = gets.strip #method should return the value the user enters.
    end
  end
end


#reminder: gets.strip removes whitespace and new lines
#allows for user input 
