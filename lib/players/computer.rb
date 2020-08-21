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

def next_to(input,board)
  case input
  when 0
    [1,3,4].detect{|x| board.cells[x] == " "}
  when 1
    [0,3,4].detect{|x| board.cells[x] == " "}
  when 2
    [1,4,5].detect{|x| board.cells[x] == " "}
  when 3
    [0,4,6].detect{|x| board.cells[x] == " "}
  when 4
    [0,1,2,3,5,6,7,8].detect{|x| board.cells[x] == " "}
  when 5
    [2,4,8].detect{|x| board.cells[x] == " "}
  when 6
    [3,4,7].detect{|x| board.cells[x] == " "}
  when 7
    [6,4,8].detect{|x| board.cells[x] == " "}
  when 8
    [4,5,7].detect{|x| board.cells[x] == " "}
  end



end

def move(board)
  puts "Computer is thinking of a move..."
  case board.turn_count
  when 0
    input = 4
  when 1
    if @game.last_move =! "5"
      input = 4
    else
      input = [0,1,2,3,5,6,7,8].sample
    end
  when 2
    puts "#{@game.last_move.class}"
    input = next_to(@game.last_move.to_i-1,board)
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
