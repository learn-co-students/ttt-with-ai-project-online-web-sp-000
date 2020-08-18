require 'pry'

# Players::Computer

module Players
  class Computer < Player
    
    def move(board)
      #binding.pry
      # condition-based algorithm: 
      # "On turn 1 always try to go in the middle 
      # if you can" and if not "try to go in a corner"
      if board.valid_move?("5")
        "5"
      elsif board.valid_move?("1")
        "1"
      elsif board.valid_move?("3")
        "3"
      elsif board.valid_move?("7")
        "7"
      elsif board.valid_move?("9")
        "9"
      elsif board.valid_move?("2")
        "2"
      elsif board.valid_move?("4")
        "4"
      elsif board.valid_move?("6")
        "6"
      elsif board.valid_move?("8")
        "8"
      end

    end

  end
end