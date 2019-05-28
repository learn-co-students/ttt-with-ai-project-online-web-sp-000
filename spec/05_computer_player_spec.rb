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
  
  describe '#move' do
    it 'returns a winning move if one is available' do
      computer = Players::Computer.new("X")
      board = Board.new
      board.cells = ["X", "X", " ", "O", "O", " ", " ", " ", " "]

      computer_move = computer.move(board)

      expect(computer_move).to eq("3")
    end
  end
  
    describe '#move' do
    it 'blocks an opponents winning move if necessary' do
      computer = Players::Computer.new("O")
      board = Board.new
      board.cells = ["X", "X", " ", "", "", " ", " ", " ", " "]

      computer_move = computer.move(board)

      expect(computer_move).to eq("3")
    end
  end
end
