require 'pry'
module Players
  class Computer < Player

    attr_accessor :game

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def move(board)
      puts "Computer is thinking of a move..."
      case board.turn_count
      when <= 3
        input = [1,2,3,4,5,6,7,8,9].sample
      when board.turn_count >= 3
          case self.token
          when "X"
          offense_array = WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" || board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" || board.cells[combo[0]] == "X" && board.cells[combo[2]] == "X"}
          defense_array = WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" || board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O" || board.cells[combo[0]] == "O" && board.cells[combo[2]] == "O"}
          if offense_array != nil
            win_move = offense_array.select{|index| index == " "}
            if win_move != nil
              input = win_move.to_i + 1
            else
              defend_move = defense_array.select{|index| index == " "}
              input = defend_move.to_i + 1
          next_move = move_array.select{|index| index == " "}
            if next_move != nil
              input = next_move.to_i + 1
            when "O"
            offense_array = WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" || board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O" || board.cells[combo[0]] == "O" && board.cells[combo[2]] == "O"}
            defense_array = WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" || board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" || board.cells[combo[0]] == "X" && board.cells[combo[2]] == "X"}
            if offense_array != nil
              win_move = offense_array.select{|index| index == " "}
              if win_move != nil
                input = win_move.to_i + 1
              else
                defend_move = defense_array.select{|index| index == " "}
                input = defend_move.to_i + 1
            next_move = move_array.select{|index| index == " "}
              if next_move != nil
                input = next_move.to_i + 1
        end
      end
    input.to_s
    end
  end
end
