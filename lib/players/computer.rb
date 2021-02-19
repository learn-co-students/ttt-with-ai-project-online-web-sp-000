module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      #binding.pry
      num_of_empty = board.cells.count(" ")
      #random number to start
      if num_of_empty > 7
        comp_position = rand(1..9)

      elsif num_of_empty < 8
        WIN_COMBINATIONS.each do |x|
          #Plays offense
          if board.cells[x[0]] == board.cells[x[1]] and board.cells[x[0]] != " "
            comp_position = board.cells[x[2]]
          elsif board.cells[x[1]] == board.cells[x[2]] and board.cells[x[1]] != " "
            comp_position = board.cells[x[0]]
          elsif board.cells[x[0]] == board.cells[x[2]] and board.cells[x[0]] != " "
            comp_position = board.cells[x[1]]
          else
            comp_position = rand(1..9)
          end
        end
      else
      end
      comp_position.to_s
      #binding.pry
    end
  end
end
