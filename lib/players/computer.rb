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

    VERTICAL_WINS = [
      [0,3,6],
      [1,4,7],
      [2,5,8],
    ]

    HORIZONTAL_WINS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
    ]

    DIAGONAL_WINS = [
      [0,4,8],
      [2,4,6]
    ]


def defense_play?
  defense_plays = []
  WIN_COMBINATIONS.each do |combo|
      token_count = 0
      opponent_token_count = 0
      blank_count = 0
    combo.each do |index|
      if @board.cells[index] == @token
        token_count += 1
      elsif @board.cells[index] == @opponent_token
        opponent_token_count += 1
      else
        blank_count += 1
      end
    end
    if opponent_token_count == 2 && blank_count == 1
      defense_plays << combo
    end
  end
  defense_plays
end

def offense_play?
  offense_plays = []
  WIN_COMBINATIONS.each do |combo|
      token_count = 0
      opponent_token_count = 0
      blank_count = 0
    combo.each do |index|
      if @board.cells[index] == @token
        token_count += 1
      elsif @board.cells[index] == @opponent_token
        opponent_token_count += 1
      else
        blank_count += 1
      end
    end
    if token_count == 2 && blank_count == 1
      offense_plays << combo
    end
  end
  offense_plays
end

def compete_play?
  compete_plays_offense = []
  compete_plays_defense = []
  final_plays = []
  WIN_COMBINATIONS.each do |combo|
      token_count = 0
      opponent_token_count = 0
      blank_count = 0
    combo.each do |index|
      if @board.cells[index] == @token
        token_count += 1
      elsif @board.cells[index] == @opponent_token
        opponent_token_count += 1
      else
        blank_count += 1
      end
    end
    if token_count == 1 && blank_count == 2
      compete_plays_offense << combo
    elsif opponent_token_count == 1 && blank_count == 2
      compete_plays_defense << combo
    end
  end
  compete_plays_offense.each do |combo|
    combo.each do |index|
    compete_plays_defense.each do |com|
      if com.include?(index)
      final_plays << combo
    end
    end
  end
end
  final_plays
end



#def defense_play?(board)
#  possible_plays = []
#  possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{@opponent_token}" && board.cells[combo[1]] == "#{@opponent_token}"}
#  possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[1]] == "#{@opponent_token}" && board.cells[combo[2]] == "#{@opponent_token}"}
#  possible_plays << WIN_COMBINATIONS.detect{|combo| board.cells[combo[0]] == "#{@opponent_token}" && board.cells[combo[2]] == "#{@opponent_token}"}
#  possible_plays.detect{|play| play != nil}
#end



def defense_move
  if defense_play?[0] != nil
    defense_play?.sample.detect{|index| @board.cells[index] == " "}
  else
    nil
  end
end

def offense_move
  if offense_play?[0] != nil
    offense_play?.sample.detect{|index| @board.cells[index] == " "}
  else
    nil
  end
end

def compete_move
  if compete_play?[0] != nil
    final_plays = compete_play?.flatten.select do |index|
      @board.open_cells.include?(index + 1) && next_to(index, @opponent_token)
    end
  end
    if final_plays != nil
      final_plays
    else
      nil
    end
  end

def opponent_board
  [0,1,2,3,4,5,6,7,8].select{|index| @board.cells[index] == @opponent_token}
end

def my_board
  [0,1,2,3,4,5,6,7,8].select{|index| @board.cells[index] == @token}
end


#def offense_play?(board)
#  possible_plays = []
#  possible_plays << WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "#{@token}" && board.cells[combo[1]] == "#{@token}"}
#  possible_plays << WIN_COMBINATIONS.collect{|combo| board.cells[combo[1]] == "#{@token}" && board.cells[combo[2]] == "#{@token}"}
#  possible_plays << WIN_COMBINATIONS.collect{|combo| board.cells[combo[0]] == "#{@token}" && board.cells[combo[2]] == "#{@token}"}
#  #possible_plays.select{|play| play != nil}
#end


#def win_move
#  win_move = []
#  if offense_play?(board)[0] != nil
#    offense_play?(board).each do |combo|
#      combo.each do |index|
#        if board.open_cells.include?(index + 1)
#          win_move << index
#        end
#      end
#    end
#    win_move.uniq.sample
#else
#nil
#end
#end

def next_to(input, char)
  case input
  when 0
    [1,3,4].select{|x| @board.cells[x] == char}
  when 1
    [0,3,4].select{|x| @board.cells[x] == char}
  when 2
    [1,4,5].select{|x| @board.cells[x] == char}
  when 3
    [0,4,6].select{|x| @board.cells[x] == char}
  when 4
    [0,1,2,3,5,6,7,8].select{|x| @board.cells[x] == char}
  when 5
    [2,4,8].select{|x| @board.cells[x] == char}
  when 6
    [3,4,7].select{|x| @board.cells[x] == char}
  when 7
    [6,4,8].select{|x| @board.cells[x] == char}
  when 8
    [4,5,7].select{|x| @board.cells[x] == char}
  end
end





def move(board)
  puts "Computer is thinking of a move..."
  case @board.turn_count
  when 0
    input = [0,2,6,8].sample
    @my_last_move = input
  when 1
    if [0,2,6,8].include?(@game.last_move)
      input = 4
      @my_last_move = input
    else
      input = [0,2,6,8].sample
      @my_last_move = input
    end
  when 2
    input = @board.open_cells.select{|x| next_to(@game.last_move, " ").include?(x-1) && next_to(my_last_move, " ").include?(x-1)}.sample
    input -= 1
  when 3..7
      if offense_move != nil
        input = offense_move
    elsif offense_move == nil && defense_move != nil
        input = defense_move
    elsif compete_move != nil && offense_move == nil && defense_move == nil
      input = compete_move
    else
      input = @board.open_cells.sample - 1
      end
    #else
    #  defend_list = []
    #  WIN_COMBINATIONS.each do |combo|
    #    combo.each do |index|
    #    if opponent_board.include?(index)
    #      if combo.none?{|index| my_board.include?(index)}
    #        defend_list << combo
    #    end
    #    end
    #  end
    #end
    #offense_list = []
    #WIN_COMBINATIONS.each do |combo|
    #  combo.each do |index|
    #  if my_board.include?(index)
    #    if combo.none?{|index| opponent_board.include?(index)}
    #      offense_list << combo
    #  end
    #  end
    #end
  #end
  #    play_1 = defend_list.flatten.detect{|index| defend_list.flatten.count(index) > 1 && @board.open_cells.include?(index + 1)}
  #    possible_plays = []
  #    possible_plays << WIN_COMBINATIONS.detect{|combo| @board.cells[combo[0]] == " " && @board.cells[combo[1]] == " "}
  #    possible_plays << WIN_COMBINATIONS.detect{|combo| @board.cells[combo[1]] == " " && @board.cells[combo[2]] == " "}
  #    possible_plays << WIN_COMBINATIONS.detect{|combo| @board.cells[combo[0]] == " " && @board.cells[combo[2]] == " "}
  #    puts "#{possible_plays.uniq.flatten}"
  #    possible_plays = possible_plays.uniq.flatten
  #    play_2 = possible_plays.detect{|index| possible_plays.count(index) > 1}

  #    if play_1 != nil && @board.open_cells.include?(play_1 + 1)
  #      input = play_1
  #    elsif
  #      play_2 != nil
  #      input = play_2
  #    else
  #      input = @board.open_cells.sample - 1
  #    end



      #  if combo.any?{|x|opponent_board(board).include?(x)} && combo.none?{|x| my_board(board).include?(x)}
      #    list << combo[0]
        #  list << combo[1]
        #  list << combo[2]
      #  end
    #  end
  #  end
    #a = list.detect{ |x| list.count(x) > 1 }


#  end

when 8
  input = @board.open_cells[0] - 1
end
input += 1
input.to_s

end




end
end
