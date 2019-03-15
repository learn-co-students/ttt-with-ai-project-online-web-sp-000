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
    close(board)
    gets_position = 0
    open_spot = 0
    if close(board) == []
      random = rand(0..8)
        if board.valid_move?(random)
          gets_position = random
        else
          psuedo_gets(board)
        end
    else
      combo_index = close(board).sample[1]
#HERE IS THE PROBLEM. The computer sometimes panics when I take its spot or I win.
        CLOSE_COMBINATIONS[combo_index].each_with_index do |value, index|
            if value != "X" && value != "O"
              open_spot = index
            end
        end
        gets_position = CLOSE_COMBINATIONS[combo_index][open_spot]
    end
    gets_position += 1
    puts gets_position
    gets_position
end

  def close(board)
    result = []
    CLOSE_COMBINATIONS.each_with_index do |sub_array, index|
      index_1 = sub_array[0]
      index_2 = sub_array[1]
      index_3 = sub_array[2]

      board_index_1 = board.cells[index_1]
      board_index_2 = board.cells[index_2]
      board_index_3 = board.cells[index_3]

        if (board_index_1 == "X" && board_index_2 == "X") || (board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "X" && board_index_3 == "X") ||
          (board_index_1 == "O" && board_index_2 == "O") || (board_index_2 == "O" && board_index_3 == "O") || (board_index_1 == "O" && board_index_3 == "O")
            result << [sub_array, index]
        end
    end
    result
  end

end
end
