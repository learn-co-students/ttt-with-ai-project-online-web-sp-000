require 'pry'

module Players

  class Computer < Player
    def move(board)
#      input = rand(1...9).to_s
#binding.pry

      input = nil
      if board.cells[0] == " "
        input = "1"
      elsif board.cells[0] != " " && board.cells[4] == " "
        input = "5"

#  - iterate through WIN_COMBINATIONS. Find a combination with two positions taken by the player's own token.
#  - choose the third position.
      elsif Game::WIN_COMBINATIONS.detect do |combo|
#binding.pry

        if combo.select{|e| board.cells[e]==self.token}.count==2 && combo.any? {|e| board.cells[e]==" "}
          binding.pry
#          input = combo.select{|e| !board.taken?(e+1)}.first.to_i.+(1).to_s
#          input = combo.detect{|e| board.cells[e]==" "}.to_s
#        elsif combo.select{|e| board.cells[e]!=self.token &&
#          board.cells[e]!=" "}.count == 2
#          input = combo.detect{|e| board.cells[e]==" "}.to_s
        end
        end
      else
        available = board.cells.select {|e| e == " "}
        input = available.sample
      end
    end
  end
end
