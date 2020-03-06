module Players
  class Computer < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]
   ]

   CORNERS = ["1","3","7","9"]
   EDGES = [
     ["2","4"],
     ["2","6"],
     ["4","8"],
     ["6","8"]
   ]

    def move(board)
      # If you can win, win
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == self.token
          input = (combo[2] + 1).to_s
          return input if board.valid_move?(input)
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] == self.token
          input = (combo[1] + 1).to_s
          return input if board.valid_move?(input)
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[2]] == self.token
          input = (combo[0] + 1).to_s
          return input if board.valid_move?(input)
        end
      end

      # If you can block, block
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != " "
          input = (combo[2] + 1).to_s
          return input if board.valid_move?(input)
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
          input = (combo[1] + 1).to_s
          return input if board.valid_move?(input)
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[2]] != " "
          input = (combo[0] + 1).to_s
          return input if board.valid_move?(input)
        end
      end

      # If a corner is taken, take corner opposite
      CORNERS.each do |corner|
        if board.taken?(corner)
          case corner
          when "1"
            return CORNERS[3] if board.valid_move?(CORNERS[3])
          when "3"
            return CORNERS[2] if board.valid_move?(CORNERS[2])
          when "7"
            return CORNERS[1] if board.valid_move?(CORNERS[1])
          when "9"
            return CORNERS[0] if board.valid_move?(CORNERS[0])
          end
        end
      end

      # Take middle
      if board.position("5") == " " && self.token == "O"
        return "5"
      end



      # Take available corner
      CORNERS.each do |corner|
        return corner if board.valid_move?(corner)
      end

      # Take edge next to taken corner
      CORNERS.each_with_index do |corner,i|
        if board.taken?(corner)
          return EDGES[i][0] if board.valid_move?(EDGES[i][0])
          return EDGES[i][1] if board.valid_move?(EDGES[i][1])
        end
      end

      # Take next possible spot if nothing above triggers
      board.cells.each_with_index do |cell, i|
        return (i+1).to_s if cell == " "
      end
    end
  end
end
