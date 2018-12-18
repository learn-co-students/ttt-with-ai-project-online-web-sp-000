module Players

  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    CORNERS = [0,2,8,6]

    def move(board)
      if !board.taken?("5")
        input = "5"
      elsif !board.taken?("1") || !board.taken?("3") || !board.taken?("7") || !board.taken?("9")
        input = ["1", "3", "7", "9"][rand(4)]
      elsif !board.taken?("2") || !board.taken?("4") || !board.taken?("6") || !board.taken?("8")
        input = ["2", "4", "6", "8"][rand(4)]
      end
#      choices = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#      input = choices[rand(9)]
    end

  end

end
