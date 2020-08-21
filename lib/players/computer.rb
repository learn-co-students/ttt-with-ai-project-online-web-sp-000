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
      when 0..2
        input = [1,2,3,4,5,6,7,8,9].sample
      when 3..9
        puts "#{board.turn_count}"
        puts "#{offense_play?(board)}"
        puts "#{win_move(board)}"
        puts "#{self.token}"
        puts "#{defense_play?(board)}"
        puts "#{defense_move(board)}"
          #if offense_play?(board) != nil
          #  input = win_move(board)
        #  elsif defense_play?(board) != nil
          #  input = defense_move(board)
        #  else
            input = [1,2,3,4,5,6,7,8,9].sample
          #end
        end
    input.to_s
  end


def offense_play?(board)
  WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{self.token}" && board.cells[combo[1]] == "#{self.token}" || board.cells[combo[1]] == "#{self.token}" && board.cells[combo[2]] == "#{self.token}" || board.cells[combo[0]] == "#{self.token}" && board.cells[combo[2]] == "#{self.token}"}
end
end

def win_move(board)
  win_move = offense_play?(board).detect{|index| board.cells[index] == " "}
  if offense_play?(board) != nil && win_move != nil
    win_move.to_i + 1
  else
    nil
  end
end

#WIN_COMBINATIONS.detect{|combo| board[combo[0]] == "X" && board[combo[1]] == "X" || board[combo[1]] == "X" && board[combo[2]] == "X" || board[combo[0]] == "X" && board[combo[2]] == "X"}

def defense_play?(board)
  self.token == "X" ? char = "O" : char = "X"
  WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{char}" && board.cells[combo[1]] == "#{char}" || board.cells[combo[1]] == "#{char}" && board.cells[combo[2]] == "#{char}" || board.cells[combo[0]] == "#{char}" && board.cells[combo[2]] == "#{char}"}
end
end


def defense_move(board)
  defense_move = defense_play?(board).detect{|index| board.cells[index] == " "}
  if defense_play?(board) != nil && defense_move != nil
    defense_move.to_i + 1
  else
    nil
  end
end
