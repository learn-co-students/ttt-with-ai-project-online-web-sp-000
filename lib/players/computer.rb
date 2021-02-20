module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)

      WIN_COMBINATIONS.each do |x|
        pos_1_val = board.cells[x[0]]
        pos_2_val = board.cells[x[1]]
        pos_3_val = board.cells[x[2]]
        #binding.pry
        if (pos_1_val == pos_2_val) && (pos_3_val == " ") && (pos_1_val == "X" || pos_1_val == "O")
          return @chosen = x[2] + 1
        elsif (pos_2_val == pos_3_val) && (pos_1_val == " ") && (pos_2_val == "X" || pos_2_val == "O")
          return @chosen = x[0] + 1
        elsif (pos_1_val == pos_3_val) && (pos_2_val == " ") && (pos_1_val == "X" || pos_1_val == "O")
          return @chosen = x[1] + 1
        else
          new_array = [1, 2, 3, 4, 5 ,6, 7, 8, 9].shuffle
          @chosen = new_array[0]
        end
      end
      @chosen.to_s
    # def move(board)
    #   rand(1..9)
    # end
    end
  end
end
