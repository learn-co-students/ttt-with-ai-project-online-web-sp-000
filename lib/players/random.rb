module Players
  class Random < Player
    
    def initialize(token)
      super
      @samples = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end
    
    def move(board)
      puts "Randomizer #{token}'s turn"
      taken = true
      sample = ""
      while taken == true
        sample = @samples.sample
        @samples.delete(sample)
        if !board.taken?(sample)
          taken = false
        end
      end
      sample
    end
  end
end