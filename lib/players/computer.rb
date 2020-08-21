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
      when 0..3
        puts "#{board.turn_count}"
        input = [1,2,3,4,5,6,7,8,9].sample
        puts "#{input}"
        #unless board.cells[input-1] == " " do
        #  input.clear
        #  input = [1,2,3,4,5,6,7,8,9].sample
      #  end
      when 4..9
        puts "#{board.turn_count}"
        puts "#{offense_play?(board)}"
          if offense_play?(board)
            puts "#{offense_play?(board)}"
            input = offense_play?(board)
            puts "#{input}"
          else defense_play?(board)
            input = defense_play?(board)
          end
        end
    input.to_s
  end


def offense_play?(board)
  move_array = WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "#{self.token}" && board.cells[combo[1]] == "#{self.token}" || board.cells[combo[1]] == "#{self.token}" && board.cells[combo[2]] == "#{self.token}" || board.cells[combo[0]] == "#{self.token}" && board.cells[combo[2]] == "#{self.token}"}
  win_move = move_array.detect{|index| index == " "}
  if win_move != nil
    win_move.to_i + 1
  end
end

def defense_play?(board)
  self.token == "X" ? char = O : char = X
  move_array = WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "#{char}" && board.cells[combo[1]] == "#{char}" || board.cells[combo[1]] == "#{char}" && board.cells[combo[2]] == "#{char}" || board.cells[combo[0]] == "#{char}" && board.cells[combo[2]] == "#{char}"}
  win_move = move_array.detect{|index| index == " "}
  if win_move != nil
    win_move.to_i + 1
  end
end
end
end
