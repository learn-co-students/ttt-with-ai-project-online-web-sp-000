require "/home/allisunflower/ttt-with-ai-project-online-web-sp-000/lib/player.rb"

module Players
  class Computer < Player
    
    attr_accessor :input
    
    def move(input = rand(9))
      @input = rand(9)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      #genreating a random number between 0 and 8 for the computer to play
      valid_moves[@input - 1]
    end
  end
  
end