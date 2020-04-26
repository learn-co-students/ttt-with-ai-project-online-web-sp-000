require 'pry'

module Players
  class Computer < Player
    CORNER_COMBINATIONS = [0,2,6,8]
    SIDE_COMBINATIONS = [1,3,5,7]

    def corner_free?(board)
      CORNER_COMBINATIONS.any? do |index|
        if (board.cells[index] != "X") && (board.cells[index] != "O")
          return index
        end
      end
    end

    def side_free?(board)
      SIDE_COMBINATIONS.any? do |index|
        if (board.cells[index] != "X") && (board.cells[index] != "O")
          return index
        end
      end
    end

    def move(board)
      #Can I make a move that will win the game?
      #Is the opponent about to win? Block!
      if board.near_win? != nil
        my_move = board.near_win?.to_i+1
        #puts "Block: #{my_move}"
      elsif board.turn_count == 1 && ((board.cells[4] != "X") && (board.cells[4] != "O"))
        my_move = 5
        #puts "Second move center is open: #{my_move}"
      elsif corner_free?(board)
        #If a corner space is free, take it
        my_move = corner_free?(board)+1
        #puts "Corner free: #{my_move}"
      elsif (board.cells[4] != "X") && (board.cells[4] != "O")
        #Take center space
        my_move = 5
        #puts "Center is open: #{my_move}"
      else
        #Otherwise, take a side space
        my_move = side_free?(board)+1
        #puts "Side free: #{my_move}"
      end
      my_move.to_s
    end
  end
end
