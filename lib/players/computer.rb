require 'pry'

module Players
  class Computer < Player
    def move(board)
      Game::WIN_COMBINATIONS.each do |combo|
        if combo.map { |index| board.cells[index] }.count("X") == 2 && combo.map { |index| board.cells[index] }.count(" ") == 0 && combo.map { |index| board.cells[index] }.count("O") == 0
          return (combo.find_index { |ele| combo[ele] == " " } + 1).to_s
        elsif combo.map { |index| board.cells[index] }.count("O") == 2 && combo.map { |index| board.cells[index] }.count(" ") == 0 && combo.map { |index| board.cells[index] }.count("O") == 0
          return (combo.find_index { |ele| combo[ele] == " " } + 1).to_s
        elsif board.cells[4] == " "
          return "5"
        elsif board.cells[0] == " "
          return "1"
        elsif board.cells[2] == " "
          return "3"
        elsif board.cells[6] == " "
          return "7"
        elsif board.cells[8] == " "
          return "9"
        else
          return default_move = (board.cells.find_index { |ele| ele == " " } + 1).to_s
        end
      end
    end
  end
end