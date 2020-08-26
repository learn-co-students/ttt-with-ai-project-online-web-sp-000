module Players
  class Human < Player
    #this is really weir.d i have seen modules inside module. but not class inside module
    #Now when you call your Human class, you'll have to call it inside its name space with Players::Human.
    #ex: Players::Human.new

    def move(board)
      #takes parameter but doesn't use it
      input = gets.strip
      #super weird. like it just collects input
    end




  end #end class


end #end module
