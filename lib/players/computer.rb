module Players

  class Computer < Player
    def move(board)
      win_list = can_i_win(board)
      block_list = should_i_block(board)
      p win_list
      p block_list
      if board.empty?
        openers
      elsif board.cells[4] == " "
        5
      elsif win_list
        choose_best_space_from_list(board,win_list)
      elsif block_list
        choose_best_space_from_list(board,block_list)
      else
        choose_next_space
      end
    end

    def can_i_win(board)
      p "I am here -  all might"
      WIN_COMBINATIONS.each do |combo|
        list = []
        p combo, "something else"
        combo.each do |space|
          if board.cells[space] == @token
            list << space
            #add space with my token onto a list <<space
          end
        end
        if list.length == 2
          p list
          return combo
        end
      end
      return false
    end

    def choose_best_space_from_list(board,list)
        list.detect{|space| board.cells[space] == " "}
    end

    def should_i_block(board)
      WIN_COMBINATIONS.each do |combo|
        list = []
        combo.each do |space|
          if board.cells[space] != @token && board.cells[space] != " "
            list << space
          end
        end
        if list.length == 2
          return combo
        end
      end
      return false
    end


    def choose_next_space
      input = board.cells.index(" ")
      input +=1
    end

    def get_corners
      [1,3,6,9]
    end

    def choose_openers(board)
      get_corners.sample
    end
  end
end
