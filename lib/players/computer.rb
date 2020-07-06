require 'pry'

module Players
  class Computer < Player

   def move(board)
     
     move = nil
      #if go 1st, "5"
      if !board.taken?(5)
        move = "5"
      #if middle is taken, then place in top left corner
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|index| !board.taken?(index)}.to_s
      else
        Game::WIN_COMBINATIONS.each do |wc|
          if board.position(wc[0]) == self.token && board.position(wc[1]) == self.token
            board.update(wc[2])
          elsif board.position(wc[0]) == self.token && board.position(wc[2]) == self.token
            board.update(wc[1])
          else
            board.update(wc[0])
          end
        end
      end

    end
  end
end



#Game::WIN_COMBINATIONS.each do |wc|
# => if board.position(wc[0]) == self.token && board.position(wc[1]) == self.token
# =>    board.update(wc[2])
# => elsif board.position(wc[0]) == self.token && board.position(wc[2]) == self.token
# =>    board.update(wc[1])
# => else
# =>    board.update(wc[0])
# => end


      #by this point, the middle, and two of the corners are filled
      #since the other player prob blocked the attempt to win through the corner

      #elsif

      #if go 3rd
        #if taken?(1) == true || taken?(9) == true then "3" || "7"
        #elsif taken?(3) == true || taken?(7) == true then "1" || "9"
        #elsif taken?(2) == true || taken?(8) == true then "1" || "7"
        #elsif taken?(4) == true || taken?(6) == true then "1" || "3" || "7" || "9"
      #if go 3rd and if taken?(1) = true && board.cells[0] == self.token, then #9
      # => elsif taken?(1) = true, then #3
      #if go 5th and if !taken?(7) = true, then #7 else #4
      #if go 5th and and if #7 not filled, then #7 else
      #if go 2nd and human's token in #5, place in one of these cells #1, 3, 7, or 9
      #if go 2nd and human's token in #1, 3, 7, or 9, then place in #5
      #if
