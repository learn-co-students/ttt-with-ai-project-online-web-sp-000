require 'pry'

module Players

  class Computer < Player

    def move(board)
      move = ""
      # When going first, take the top left square (1)
      if board.turn_count == 0
        move = "1"
      elsif board.turn_count == 1
        move = "5" unless !board_taken?(5)
      elsif board.turn_count == 2
        move = [3, 7, 9].detect{ |i| !board_taken?(i) }.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "8"
      elsif board.turn_count == 6 && (board.position(3) == board.position(9))
        move = "6"
      elsif board.turn_count == 6 && (board.position(9) == "")
        move "9"
      end

    end
  end
end
