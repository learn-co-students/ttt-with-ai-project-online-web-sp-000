module Players
  class Computer < Player
    # can make moves (on own)
    # AI move needs to return an index+1 as string

    # stub logic - move into next available space
    def move(board=nil)
      puts "Computer Player is moving"
      "#{board.cells.find_index(" ") + 1}"
    end
  end
end


# real logic (check first then go down list)
  # 1. win or block
      # if two spaces of win combo filled with same token and third empty, move into third
  # 2. setup win
  # 3. move into center
  # 4. move into corner if connecting row or column has no opponent token
