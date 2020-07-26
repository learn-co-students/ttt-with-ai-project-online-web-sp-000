module Players
  class Human < Player
    #attr_accessor :move

    # can make moves (based on human interaction)
    def move(board=nil)
      puts "Where would you like to go? (1-9)"
      gets.strip
    end
  end
end
