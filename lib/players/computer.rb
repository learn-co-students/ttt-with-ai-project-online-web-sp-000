module Players
  class Computer < Player
    
    def move(board)
      # I basically tell the AI to pick the middle if it can
      # If it's taken already AI goes for a random pick from odd position numbers (corners)
      # Last resort is a random pick from even positions (everything besides the middle and the corners)
      
      return "5" if !board.taken?("5")
      
      av_corners = ["1", "3", "7", "9"].select do |num|
        !board.taken?(num)
      end
      
      return av_corners.sample if !av_corners.empty?
      
      av_rest = ["2", "4", "6", "8"].select do |num|
        !board.taken?(num)
      end
      
      return av_rest.sample if !av_rest.empty?
    end
    
  end
end