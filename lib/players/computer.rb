require 'pry'
module Players

# strategy
# if moving first, place token in random corner cell
# if moving second, place token in center if valid
# if center is not valid, proceed to random move
# pick random cells to move for remainder of game

  class Computer < Player

    MOVE_PRESETS = [
      [1, 3, 7, 9] #corner cell
    ]

    def move(board)
      move = nil
      if board.turn_count < 1
        move = corner_move(board)
      elsif board.turn_count == 1
        move = center_move(board)
      else
        move = random_move(board)
      end
      puts "Computer moves to position #{move}"
        move.to_s
    end

    def corner_move(board)
      valid_moves = []
      random_move = nil
      MOVE_PRESETS[0].each do |cell|
        if board.valid_move?(cell)
          valid_moves << cell
        end
      end
      random_move = valid_moves.sample
      random_move
    end

    def center_move(board)
      move = nil
      if board.valid_move?(4)
        move = 5
      end
      move
    end

    def random_move(board)
      valid_moves = []
      random_move = nil
      board.cells.each_with_index do |cell, index|
        if board.valid_move?(index + 1)
          valid_moves << index
        end
      end
      random_move = valid_moves.sample + 1
      random_move
    end
  end
end
