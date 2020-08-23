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
  possible_plays = []
  possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{@opponent_token}" && board.cells[combo[1]] == "#{@opponent_token}"}
  possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[1]] == "#{@opponent_token}" && board.cells[combo[2]] == "#{@opponent_token}"}
  possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{@opponent_token}" && board.cells[combo[2]] == "#{@opponent_token}"}
  possible_plays.detect{|play| play != nil}
end



def defense_move(board)
  if defense_play?(board) != nil
    defense_play?(board).detect{|index| board.cells[index] == " "}
  else
    nil
  end
end

def opponent_board(board)
  board.cells.select{|x| x == @opponent_token}
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
    [1,3,4].select{|x| board.cells[x] == " "}
  when 1
    [0,3,4].select{|x| board.cells[x] == " "}
  when 2
    [1,4,5].select{|x| board.cells[x] == " "}
  when 3
    [0,4,6].select{|x| board.cells[x] == " "}
  when 4
    [0,1,2,3,5,6,7,8].select{|x| board.cells[x] == " "}
  when 5
    [2,4,8].select{|x| board.cells[x] == " "}
  when 6
    [3,4,7].select{|x| board.cells[x] == " "}
  when 7
    [6,4,8].select{|x| board.cells[x] == " "}
  when 8
    [4,5,7].select{|x| board.cells[x] == " "}
  end



end

def move(board)
  puts "Computer is thinking of a move..."
  case board.turn_count
  when 0
    input = 4
    @my_last_move = input
  when 1
    if @game.last_move != 4
      input = 4
      @my_last_move = input
    else
      input = [0,1,2,3,5,6,7,8].sample
      @my_last_move = input
    end
  when 2
    puts "#{board.open_cells}"
    input = board.open_cells.detect{|x| next_to(@game.last_move, board).include?(x-1) == true && next_to(my_last_move, board).include?(x-1) ==  true}
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
