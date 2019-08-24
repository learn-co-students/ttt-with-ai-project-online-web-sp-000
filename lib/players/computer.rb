require 'pry'

module Players

  class Computer < Player
    def move(board)
      win_list = can_i_win(board)
      block_list = should_i_block(board)
      if board.empty?
        choose_openers(board)
      elsif board.cells[4] == " "
        return 5
      elsif win_list == true
        choose_best_space_from_list(board,win_list)
      elsif block_list == true
        choose_best_space_from_list(board,block_list)
      else
        choose_next_space(board)
      end
    end

    def can_i_win(board)
      WIN_COMBINATIONS.detect do |combo|
        list = []
        combo.each do |space|
          if board.cells[space] != @token && board.cells[space] != " "
            break
          end
          if board.cells[space] == @token
            list << space
          end
        end
        if list.length == 2
        return combo
        end
      end
    end

    def choose_best_space_from_list(board,list)
      if list != nil
        return list.detect{|space| board.cells[space] == " "}+1
      end
        return false
    end

    def should_i_block(board)
      WIN_COMBINATIONS.detect do |combo|
        list = []
        combo.each do |space|
          if board.cells[space] == @token
            break
          elsif board.cells[space] != @token && board.cells[space] != " "
            list << space
          end
        end
        binding.pry
        if list.length == 2
          return combo
        else
          list = nil
        end
      end
      return false
    end

    def choose_next_space(board)
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
