module Players

  class Computer < Player

    def old_move(board)
      (board.cells.index { |x| x == " " } + 1).to_s
    end

    def opp_token
      self.token == 'X' ? 'O' : 'X'
    end

    def win_comb
      Game::WIN_COMBINATIONS
    end

    def move(board)
      #set to any open position as default
      move_to_make = board.cells.index { |x| x == " " }

      win_comb.find do |v|
         values = board.cells.values_at(v[0],v[1],v[2])
         #set move to a combo with 1 opp_token and 2 empty spaces
         if values.count(opp_token) == 1 && values.count(' ') == 2
           move_to_make = v.find do |item| board.cells[item] == ' '
           end
         end
         #set move to a combo with 1 opp_token and 2 empty spaces
         if values.count(opp_token) == 2 && values.count(' ') == 1
           move_to_make = v.find do |item| board.cells[item] == ' '
           end
         end
       end
       (move_to_make + 1).to_s
    end

  end
end
