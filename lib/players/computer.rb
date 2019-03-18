module Players
class Computer < Player

  require "pry"

  CLOSE_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def move(board)
    #binding.pry
    puts "Player #{self.token} - Please input a #1-9."
    input = "#{psuedo_gets(board)}"
    input
  end

  def psuedo_gets(board)
    gets_position = 0
    positions = []
    if close(board) != []
      close(board).each do |sub_array|
          sub_array.each do |value|
            test = value+1
            if board.valid_move?(test)
              positions << test
        end
        end
      end
      gets_position = positions.sample
    else
      board.cells.each_with_index do |v, i|
        test = i+1
        if board.taken?(test) == false
          positions << test
        end
      end
    gets_position = positions.sample
    end
    puts gets_position
    gets_position
end

def close(board)
  #binding.pry
    result = []
    CLOSE_COMBINATIONS.each_with_index do |sub_array, index|
#these return the numbers/indexes associated with a winning combination
      number_1 = sub_array[0]
      number_2 = sub_array[1]
      number_3 = sub_array[2]

#these tell you the values associated with an index
board_index_1 = board.cells[number_1]
board_index_2 = board.cells[number_2]
board_index_3 = board.cells[number_3]

#this checks to see if 2 of the values are the same, and if the last value is open && valid
      if ((board_index_1 == "X" || board_index_1 == "O") && board_index_1 == board_index_2 && board.valid_move?(number_3+1)) ||
        ((board_index_2 == "X" || board_index_2 == "O") && board_index_2 == board_index_3 && board.valid_move?(number_1+1))  ||
        ((board_index_1 == "X" || board_index_1 == "O") && board_index_1 == board_index_3 && board.valid_move?(number_2+1))
            result << sub_array
      end
    end
      result
  end


end
end
