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





def defense_play?(board)
  self.token == "X" ? char = "O" : char = "X"
  WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{char}" && board.cells[combo[1]] == "#{char}" || board.cells[combo[1]] == "#{char}" && board.cells[combo[2]] == "#{char}" || board.cells[combo[0]] == "#{char}" && board.cells[combo[2]] == "#{char}"}
end



def defense_move(board)
  if defense_play?(board) != nil
    defense_play?(board).detect{|index| board.cells[index] == " "}
  else
    nil
  end
end


def offense_play?(board)
WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{self.token}" && board.cells[combo[1]] == "#{self.token}" || board.cells[combo[1]] == "#{self.token}" && board.cells[combo[2]] == "#{self.token}" || board.cells[combo[0]] == "#{self.token}" && board.cells[combo[2]] == "#{self.token}"}
end


def win_move(board)
  if offense_play?(board) != nil
    offense_play?(board).detect{|index| board.cells[index] == " "}
else
nil
end
end

def move(board)
  puts "Computer is thinking of a move..."
  case board.turn_count
  when 0..2
    input = rand(8)
  when 3..9
    if win_move(board) != nil
        input = win_move(board)
    elsif defense_move(board) != nil
        input = defense_move(board)
    else
        input = rand(8)
      end
    end
input += 1
input.to_s
end

end
end
