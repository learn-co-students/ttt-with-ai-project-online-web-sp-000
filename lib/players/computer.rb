module Players # start 1
  class Computer < Player # start 2
    attr_accessor :return_num, :potential_winner, :potential_loser

    def random # start 4
      rand(1..9)
    end # end 4 module #random

    def move(board) # start 3
      @potential_winner = nil
      @potentil_loser = nil

      my_tok = board.current_player
      my_tok == "X"? op_tok = "O" : op_tok = "X" # no end needed because it is a one-line conditional

      victory_combinations = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],  # bottom column
        [0,3,6],  # left column
        [1,4,7],  # center column
        [2,5,8],  # right column
        [0,4,8],  # diagonal 1
        [2,4,6]  # diagonal 2
      ]

      if board.cells[4] == " " # start the conditional based on if the middle is blank
        @return_num = 5

      else # this would be if the middle is taken
        one_blank = victory_combinations.select {|combo| combo.count{|num| board.cells[num] == " "} == 1}

        if one_blank == [] # start conditional based on return value of one_blank
          @return_num = random
        # below code is to take my winning spot
        else
          @potential_winner = one_blank.detect {|combo| combo.count{|cell| board.cells[cell] == my_tok} == 2}
          @potential_loser = one_blank.detect {|combo| combo.count{|cell| board.cells[cell] == op_tok} == 2}
          if @potential_winner != nil # start conditional which returns the number of the blank spot in a potential winner first, loser second
            @return_num = @potential_winner.detect {|cell| board.cells[cell] == " "} + 1
          elsif @potential_loser != nil
            @return_num = @potential_loser.detect {|cell| board.cells[cell] == " "} + 1
          else
            @return_num = random
          end # end conditional which returns the number of the blank spot in a potential winner first, loser second
        end # end the conditional based on the return value of one_blank

      end # end the conditional based on if the middle is blank

#      @return_num.to_s
      @return_num.to_s
    end # end 3 method #move
  end # end 2 class Computer
end # end 1 module Players
