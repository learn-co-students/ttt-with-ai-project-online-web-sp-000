module Players
  class Computer < Player
    attr_reader :input

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
      board.display
      @input = smart_move(board)
      puts "My input is #{@input}"
    end

    def smart_move(board)
      smart_move = WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == " ") ||
        (board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == " ") ||
        (board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" && board.cells[combo[0]] == " ") ||
        (board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O" && board.cells[combo[0]] == " ") ||
        (board.cells[combo[0]] == "X" && board.cells[combo[2]] == "X" && board.cells[combo[1]] == " ") ||
        (board.cells[combo[0]] == "O" && board.cells[combo[2]] == "O" && board.cells[combo[1]] == " ")
      end

      if smart_move != nil
        smart_input = smart_move.detect do |spot|
          board.cells[spot] == " "
        end
        if smart_input != nil
          (smart_input + 1).to_s
        else
          rand(1..9).to_s
        end
      else
        rand(1..9).to_s
      end
    end
  end
end

# WIN_COMBINATIONS.detect do |combo|
#   (board[combo[0]] == "X" && board[combo[1]] == "X") ||
#   (board[combo[0]] == "O" && board[combo[1]] == "O") ||
#   (board[combo[1]] == "X" && board[combo[2]] == "X") ||
#   (board[combo[1]] == "O" && board[combo[2]] == "O") ||
#   (board[combo[0]] == "X" && board[combo[2]] == "X") ||
#   (board[combo[0]] == "O" && board[combo[2]] == "O")
# end
