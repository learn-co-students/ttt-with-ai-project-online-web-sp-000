module Players
  class Computer < Player
  #  attr_accessor :cells

    def move(board)
  #  binding.pry
  #  board.cells.sample
  #if else statement. Check won? against win combinations
  #try case statment
#  Game::WIN_COMBINATIONS.each do |win_combination|
  #if board.cells == Game::win_combination[0] && Game::win_combination[1]
#     win_combination[3]
  move = nil
  if board.valid_move?(1) && board.turn_count < 9
 move = "1" || "9" || "5" || "3" || "7" || "2" || "4" || "6" || "8"
  # if board[1] == " "
  #   "1"
  # elsif board[9] == " "
  #   "9"
  # elsif board[7] == " "
  #       "7"
  # elsif board[3] == " "
  #       "3"
  # elsif board[4] && board[5] != " "
  #   "6"
  # elsif board[5] && board[6] != " "
  #   "4"
  # elsif board[4] && board[6] != " "
  #   "5"
  # elsif board[2] && board[8] != " "
  #   "5"
  # elsif board[2] && board[6] != " "
  #   "5"
  # else board[5] && board[8] != " "
  #   "2"
     end
    move
    end

end

end
