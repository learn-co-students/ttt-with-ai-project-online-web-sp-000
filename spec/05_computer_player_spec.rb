require 'spec_helper'

describe 'Players::Computer' do
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new
      board.cells[1,5] = "O"
      board.cells[2,4] = "X"

      valid_moves = ["1", "4", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end
  
  it 'Plays a perfect game (AI Will always Tie)' do
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    game.board.cells[4] = "X" # setting first move so it processes faster.
    expect {game.play}.to output(/Cat's Game!/).to_stdout
  end
end
