require 'spec_helper'

describe 'Players::Computer' do
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end

#   describe '#check' do
#     it 'returns the threat of winning combos in arrays'
#       computer = Players::Computer.new("X")
#       board = Board.new
# # binding.pry
#       board.cells = ["X", "X", " ", "O", "O", "X", "O", "O", " "]
#       this_board = computer.check(board)
#       binding.pry
#       expect(this_board).to include([1,2,3])
#     end

  describe 'concerning_combos' do
    it 'does something' do
      computer = Players::Computer.new("X")
      board = Board.new

      board.cells = ["X", "X", " ", "O", "O", "X", "O", "O", " "]
      check_board = [[0, 1, 2], [6, 7, 8], [6, 4, 2]]
      # binding.pry
    end
  end

end
