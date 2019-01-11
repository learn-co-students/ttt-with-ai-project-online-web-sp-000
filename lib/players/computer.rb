module Players
  class Computer < Player
    #build computer logic that represents the Computer Player
    #It should return a valid move in the form of a 1-9 string
    #You can hardcode your logic, things like "On turn 1 always try to go
    #in the middle if you can" and if not "try to go in a corner" or any logic tree you can think of
    def move(board)
      #if this is my first move, then go to cell "5", else if this is my 2nd move, check to see if cell "5" is empty
      #if cell "5" is taken, put token at a corner
      #if I took cell "5" then pick a corner

    end

  end
end
