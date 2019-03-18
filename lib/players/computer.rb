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
    puts "Player #{self.token} - Please input a #1-9."
    input = "#{psuedo_gets(board)}"
    input
  end

  def psuedo_gets(board)
    gets_position = 0
    open_spot = 0
    # if close(board) == []
    #   random = rand(0..8)
    #     if board.valid_move?(random+1)
    #       gets_position = random
    #     else
    #       psuedo_gets(board)
    #     end
    #else
    #binding.pry
        combo_index = close(board).sample[1]
        CLOSE_COMBINATIONS[combo_index].each_with_index do |value, index|
            if board.valid_move?(index+1)
              open_spot = index
              gets_position = CLOSE_COMBINATIONS[combo_index][open_spot]
              gets_position += 1
            else
              random = rand(1..9)
              if board.valid_move?(random)
                gets_position = random
              end
            end
    end
    puts gets_position
    gets_position
end


def close(board)
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
      if ((board_index_1 == board_index_2) && board.valid_move?(number_3+1)) ||
        ((board_index_3 == board_index_2) && board.valid_move?(number_1+1)) ||
        ((board_index_3 == board_index_1) && board.valid_move?(number_2+1))
            result << [sub_array, index]
      end
    end
      result
  end

end
end
