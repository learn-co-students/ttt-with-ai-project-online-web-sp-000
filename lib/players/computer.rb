module Players
  class Computer < Player
    
    def move(board)
      return "5" if !board.taken?("5")
      return "1" if !board.taken?("1")
      return "3" if !board.taken?("3")
      return "7" if !board.taken?("7")
      return "9" if !board.taken?("9")
      return "2" if !board.taken?("2")
      return "4" if !board.taken?("4")
      return "6" if !board.taken?("6")
      return "8" if !board.taken?("8")
    end
    
  end
end