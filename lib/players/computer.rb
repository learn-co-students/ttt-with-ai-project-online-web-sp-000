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
      # If win combo is 2/3 full, either block or win
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

      # If a corner is taken, take edge next to it, if available
      CORNERS.each_with_index do |corner,i|
        if board.taken?(corner)
          return EDGES[i][0] if board.valid_move?(EDGES[i][0])
          return EDGES[i][1] if board.valid_move?(EDGES[i][1])
        end
      end

      # If O, take middle
      if board.position("5") == " " && self.token == "O"
        return "5"
      end

      # Take available corner
      CORNERS.each do |corner|
        return corner if board.valid_move?(corner)
      end

      # Take next possible spot if nothing above triggers
      board.cells.each_with_index do |cell, i|
        return (i+1).to_s if cell == " "
      end
    end
  end
end
