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
  [0,1,2,3,4,5,6,7,8].select{|index| board.cells[index] == @opponent_token}
end

def my_board(board)
  [0,1,2,3,4,5,6,7,8].select{|index| board.cells[index] == @token}
end


def offense_play?(board)
  possible_plays = []
  possible_plays << WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "#{@token}" && board.cells[combo[1]] == "#{@token}"}
  possible_plays << WIN_COMBINATIONS.collect{|combo| board.cells[combo[1]] == "#{@token}" && board.cells[combo[2]] == "#{@token}"}
  possible_plays << WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "#{@token}" && board.cells[combo[2]] == "#{@token}"}
  #possible_plays.select{|play| play != nil}
end


def win_move(board)
  win_move = []
  if offense_play?(board)[0] != nil
    offense_play?(board).each do |combo|
      combo.each do |index|
        if board.open_cells.include?(index + 1)
          win_move << index
        end
      end
    end
    win_move.uniq.sample
else
nil
end
end

def next_to(input,board,char)
  case input
  when 0
    [1,3,4].select{|x| board.cells[x] == char}
  when 1
    [0,3,4].select{|x| board.cells[x] == char}
  when 2
    [1,4,5].select{|x| board.cells[x] == char}
  when 3
    [0,4,6].select{|x| board.cells[x] == char}
  when 4
    [0,1,2,3,5,6,7,8].select{|x| board.cells[x] == char}
  when 5
    [2,4,8].select{|x| board.cells[x] == char}
  when 6
    [3,4,7].select{|x| board.cells[x] == char}
  when 7
    [6,4,8].select{|x| board.cells[x] == char}
  when 8
    [4,5,7].select{|x| board.cells[x] == char}
  end
end





def move(board)
  puts "Computer is thinking of a move..."
  case board.turn_count
  when 0
    input = [0,2,6,8].sample
    @my_last_move = input
  when 1
      input = next_to(@game.last_move, board, " ").sample
      @my_last_move = input
  when 2
    input = board.open_cells.select{|x| next_to(@game.last_move, board, " ").include?(x-1) && next_to(my_last_move, board, " ").include?(x-1)}.sample
    input -= 1
  when 3..7

  #  puts "win move#{win_move(board)}"
  #  puts "offense play #{offense_play?(board)}"
  #  puts "defense move#{defense_move(board)}"
  #  puts "defense play#{defense_play?(board)}"

  #  puts "#{win_move(board)}"
  #  if win_move(board) != nil
      #  input = win_move(board)
  #  elsif win_move(board) == nil && defense_move(board) != nil
      #  input = defense_move(board)
    #else
      defend_list = []
      WIN_COMBINATIONS.each do |combo|
        combo.each do |index|
        if opponent_board(board).include?(index)
          if combo.none?{|index| my_board(board).include?(index)}
            defend_list << combo
        end
        end
      end
    end
    offense_list = []
    WIN_COMBINATIONS.each do |combo|
      combo.each do |index|
      if my_board(board).include?(index)
        if combo.none?{|index| opponent_board(board).include?(index)}
          offense_list << combo
      end
      end
    end
  end
      play_1 = defend_list.flatten.detect{|index| defend_list.flatten.count(index) > 1 && board.open_cells.include?(index + 1)}
      possible_plays = []
      possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == " " && board.cells[combo[1]] == " "}
      possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[1]] == " " && board.cells[combo[2]] == " "}
      possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == " " && board.cells[combo[2]] == " "}
      puts "#{possible_plays.uniq.flatten}"
      possible_plays = possible_plays.uniq.flatten
      play_2 = possible_plays.detect{|index| possible_plays.count(index) > 1}

      if play_1 != nil && board.open_cells.include?(play_1 + 1)
        input = play_1
      elsif
        play_2 != nil
        input = play_2
      else
        input = board.open_cells.sample - 1
      end

      puts "#{possible_plays}"

      puts "#{input}"
      puts "#{defend_list.flatten}"
      puts "#{offense_list.flatten}"
      puts "#{play_1}"
      puts "#{play_2}"
      puts "#{input}"

      #  if combo.any?{|x|opponent_board(board).include?(x)} && combo.none?{|x| my_board(board).include?(x)}
      #    list << combo[0]
        #  list << combo[1]
        #  list << combo[2]
      #  end
    #  end
  #  end
    #a = list.detect{ |x| list.count(x) > 1 }


#  end
#end
when 8
  puts "here is 8"
  puts "#{board.open_cells}"
  input = board.open_cells[0] - 1

end
input += 1
input.to_s

end




end
end
