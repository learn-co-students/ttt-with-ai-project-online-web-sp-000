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
  
  describe '#next_move' do 
    it 'Computer chooses the best move, to block with the best strategic position Center -> Corner -> Other' do 
      computer = Players::Computer.new("X")
      player = Players::Human.new('O')
      board = Board.new
      game = Game.new(computer, player, board)
      
      cells_1 = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
      cells_2 = [' ',' ','O',' ','X',' ',' ',' ',' ']
      cells_3 = ['X',' ','O',' ','X',' ',' ',' ','O']
      cells_4 = ['X',' ','O','O','X','X',' ',' ','O']
      cells_5 = ['X',' ','O','O','X','X','X','O','O']
      
      board.cells = cells_1
      expect(computer.next_move).to eq(5)
      
      board.cells = cells_2
      expect(computer.next_move).to eq(1).or eq(9)
      
      board.cells = cells_3
      expect(computer.next_move).to eq(6)
      
      board.cells = cells_4
      expect(computer.next_move).to eq(7)
      
      board.cells = cells_5
      expect(computer.next_move).to eq(2)
      
    end 
  end
  
  describe '#valid_losses' do 
    it 'returns a list of winning combinations for the opponent with valid moves sorted descending by opponent token count' do 
      computer = Players::Computer.new("X")
      player = Players::Human.new('O')
      board = Board.new
      game = Game.new(computer, player, board)
      game.board.cells = ["X", "X", "O", " ", "X", "O", "O", " ", " "]
      
      expect(computer.valid_losses[0]).to eq([2,5,8])
    end 
  end
  
  describe '#valid_four' do 
    it 'returns 4 if the array contains a valid four, nil if not' do 
      computer = Players::Computer.new("X")
      player = Players::Human.new('O')
      board = Board.new
      game = Game.new(computer, player, board)
      
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
      triplet_1 = [0,1,2]
      triplet_2 = [1,4,7]
      
      expect(computer.valid_four(triplet_1)).to eq(nil)
      expect(computer.valid_four(triplet_2)).to eq(nil)
      
      board.cells = ["X", " ", "X", "X", " ", " ", "O", "O", " "]
      expect(computer.valid_four(triplet_1)).to eq(nil)
      expect(computer.valid_four(triplet_2)).to eq(4)
      
    end 
  end 
  
  describe '#valid_even' do 
    it 'returns first valid even, nil if none' do 
      computer = Players::Computer.new("X")
      player = Players::Human.new('O')
      board = Board.new
      game = Game.new(computer, player, board)
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
      triplet_1 = [0,1,2]
      triplet_2 = [2,5,8]
      
      expect(computer.valid_even(triplet_1)).to eq(nil)
      expect(computer.valid_even(triplet_2)).to eq(8)
    end 
  end
  
  describe 'valid_odd' do 
    it 'returns the first valid odd, nil if none' do
      computer = Players::Computer.new("X")
      player = Players::Human.new('O')
      board = Board.new
      game = Game.new(computer, player, board)
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
      triplet_1 = [0,1,2]
      triplet_2 = [2,5,8]
      
      expect(computer.valid_odd(triplet_1)).to eq(1)
      expect(computer.valid_odd(triplet_2)).to eq(5)
    end 
  end
  
end
  
