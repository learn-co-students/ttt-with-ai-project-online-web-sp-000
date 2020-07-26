module Players

  class Human < Player
    
    def move(board = nil)
      puts "Where y'all want to put your mark?"
      input = gets.strip
      input
    end
  end
  
end