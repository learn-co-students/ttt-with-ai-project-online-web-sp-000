require_relative '../player'
require 'pry'
module Players
  class Computer < Player
    attr_accessor :moves_taken

    def initialize(token)
      super(token)
      @computer_move = []
    end

      WIN_COMBINATIONS = [["1","2","3"],["4","5","6"],["7","8","9"],["1","4","7"],
      ["2","5","8"],["3","6","9"],["1","5","9"],["3","5","7"]]

    def move(board)
      result = nil
      board.display
      if board.turn_count == 0 || board.turn_count == 1
         first_move = rand(10).to_s
         @computer_move << first_move
         first_move
      else
         combo = combination_to_play
         next_move = find_next_move(board)
      end

    end

    def combination_to_play
      WIN_COMBINATIONS.select {|x| x.include?(@computer_move)}

    end

    def find_next_move(board)
      result = nil
      combination_to_play.each do |combo|
        combo.find do |num_str|
          if board.valid_move?(num_str)
            result = num_str
          end
        end
      end
      if result
        result
      else
        another_move = rand(10).to_s
        if board.valid_move?(another_move)
          result = another_move
        end
      end
    end
  end
end
