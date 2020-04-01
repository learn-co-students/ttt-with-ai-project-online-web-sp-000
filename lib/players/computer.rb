module Players
  class Computer < Player
    def move(board)

      if @token == "X"
        other_token = "O"
      else
        other_token = "X"
      end

      #if we have an win available take it
      Game::WIN_COMBINATIONS.each do |w|

        if board.cells[w[0]] == " " && board.cells[w[1]] == @token && board.cells[w[2]] == @token
          return (w[0]+1).to_s
        end
        if board.cells[w[0]] == @token && board.cells[w[1]] == " " && board.cells[w[2]] == @token
          return (w[1]+1).to_s
        end
        if board.cells[w[0]] == @token && board.cells[w[1]] == @token && board.cells[w[2]] == " "
          return (w[2]+1).to_s
        end

      end

      #see if other player is 1 move from win and block
      Game::WIN_COMBINATIONS.each do |w|

        if board.cells[w[0]] == " " && board.cells[w[1]] == other_token && board.cells[w[2]] == other_token
          return (w[0]+1).to_s
        end
        if board.cells[w[0]] == other_token && board.cells[w[1]] == " " && board.cells[w[2]] == other_token
          return (w[1]+1).to_s
        end
        if board.cells[w[0]] == other_token && board.cells[w[1]] == other_token && board.cells[w[2]] == " "
          return (w[2]+1).to_s
        end

      end

      #play next to another of own positions on open line of 3
      #if we have an win available take it
      Game::WIN_COMBINATIONS.each do |w|

        if board.cells[w[0]] == @token && board.cells[w[1]] == " " && board.cells[w[2]] == " "
          return (w[2]+1).to_s
        end
        if board.cells[w[0]] == " " && board.cells[w[1]] == @token && board.cells[w[2]] == " "
          return (w[0]+1).to_s
        end
        if board.cells[w[0]] == " " && board.cells[w[1]] == " " && board.cells[w[2]] == @token
          return (w[0]+1).to_s
        end

      end

      #todo: play in open location on line of 3, scored by # of open lines


      #play in the center if it's open
      if board.cells[4] == " "
        return "5"
      end

      #otherwise play in random location
      open_cells = []
      board.cells.each_with_index do |c,i|
        if c == " "
          open_cells << i
        end
      end
      return (open_cells[rand(0..open_cells.length-1)]+1).to_s

    end
  end

end
