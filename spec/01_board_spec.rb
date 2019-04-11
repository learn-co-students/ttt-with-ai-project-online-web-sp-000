require 'spec_helper'

describe "Board" do
  let(:board){Board.new}

  describe '#cells' do
    it 'has an attribute to store the cells of the board' do
      expect(board).to respond_to(:cells)
      expect(board).to respond_to(:cells=)

      board.cells = []
      expect(board.cells).to match_array([])
    end
  end

  describe '#reset!' do
    it 'can reset the state of the cells in the board' do
      expect(board).to respond_to(:reset!)
      board.cells = ["X"]
      board.reset!
      expect(board.cells).to_not match_array(["X"])
    end
    it 'sets the cells of the board to a 9 element array of " "' do
      board.cells = ["X"]
      board.reset!
      expect(board.cells).to match_array(Array.new(9, " "))
    end
  end

  describe '#initialize' do
    it 'sets the cells of the board to a 9 element array of " "' do
      board = Board.new
      expect(board.cells).to match_array(Array.new(9, " "))
    end
  end

  describe '#display' do
    it 'prints the board' do
      board.cells = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]

      output = capture_puts{ board.display }

      expect(output).to include(" X | X | X ")
      expect(output).to include("-----------")
      expect(output).to include(" X | O | O ")
      expect(output).to include("-----------")
      expect(output).to include(" X | O | O ")


      board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      output = capture_puts{ board.display }

      expect(output).to include(" X | O | X ")
      expect(output).to include("-----------")
      expect(output).to include(" O | X | X ")
      expect(output).to include("-----------")
      expect(output).to include(" O | X | O ")
    end
  end

  describe '#position' do
    it 'takes in user input and returns the value of the board cell' do
      board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(board.position("1")).to eq("O")
      expect(board.position("2")).to eq(" ")
      expect(board.position("5")).to eq("X")
    end
  end

  describe '#full?' do
    it 'returns true for a full board' do
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(board.full?).to be_truthy
    end

    it 'returns false for an in-progress game' do
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(board.full?).to be_falsey
    end
  end

  describe '#turn_count' do
    it 'returns the amount of turns based on cell value' do
      board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(board.turn_count).to eq(3)
    end
  end

  describe '#taken?' do
    it 'returns true if the position is X or O' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", "O"]

      expect(board.taken?("1")).to be(true)
      expect(board.taken?("9")).to be(true)
    end

    it 'returns false if the position is empty or blank' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", "O"]

      expect(board.taken?("2")).to be(false)
      expect(board.taken?("7")).to be(false)
    end
  end

  describe '#corner_move_available?' do
    it 'returns available corner index' do
      board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      
      expect(board.corner_move_available?).to eq(0)
    end
    it 'returns available corner index' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
      
      expect(board.corner_move_available?).to eq(2)
    end
    it 'returns available corner index' do
      board.cells = ["X", "X", "X", "O", "X", "O", " ", " ", " "]
      
      expect(board.corner_move_available?).to eq(6)
    end
    it 'returns available corner index' do
      board.cells = ["X", " ", "X", " ", " ", " ", "X", " ", "X"]
      
      expect(board.corner_move_available?).to eq(false)
    end
  end
  
  describe '#win_imminent?' do
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
      
      expect(board.win_imminent?).to match_array([0, 1, 2])
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", " ", " ", "X", " ", " ", " ", " ", " "]
      
      expect(board.win_imminent?).to match_array([0, 3, 6])
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", "X", "O", " ", " ", " ", " ", " ", " "]
      
      expect(board.win_imminent?).to be(false)
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", " ", " ", " ", "X", " ", " ", " ", " "]
      
      expect(board.win_imminent?).to match_array([0, 4, 8])
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", " ", " ", " ", "O", " ", " ", " ", "X"]
      
      expect(board.win_imminent?).to be(false)
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = [" ", " ", " ", " ", " ", "O", " ", " ", "O"]
      
      expect(board.win_imminent?).to match_array([2, 5, 8])
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", " ", " ", " ", "O", " ", " ", "O", "X"]
      
      expect(board.win_imminent?).to match_array([1, 4, 7])
    end
    it 'returns true if two tokens and empty in a "row"' do
      board.cells = ["X", "X", "O", " ", "O", " ", " ", "O", "X"]
      
      expect(board.win_imminent?).to match_array([2, 4, 6])
    end
  end
  describe '#valid_move?' do
    it 'returns true for user input between 1-9 that is not taken' do
      board.cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

      expect(board.valid_move?("1")).to be_truthy
      expect(board.valid_move?("5")).to be_falsey
      expect(board.valid_move?("invalid")).to be_falsey
    end
  end
  
  describe '#setup?' do
    it 'returns index of best move if any setup shape present' do
      board.cells = [" ", " ", "O", " ", "X", " ", "X", " ", " "]
      
      expect(board.setup?).to eq(0).or eq(8)
    end
    it 'returns index of best move if horse shape present' do
      board.cells = [" ", " ", "X", " ", "O", " ", " ", "X", " "]
      
      expect(board.setup?).to eq(8)
    end
    it 'returns true if half cross present' do
      board.cells = [" ", "O", " ", " ", "X", "O", " ", " ", " "]
      
      expect(board.setup?).to eq(2)
    end
    it 'returns index of best move if diagonal_sandwich present' do
      board.cells = ["X", " ", " ", " ", "O", " ", " ", " ", "X"]
      
      expect(board.setup?).to eq(1).or eq(3).or eq(5).or eq(7)
    end
    it 'returns nil when no setup present' do
      board.cells = [" ", "X", "O", " ", " ", " ", " ", " ", " "]
      
      expect(board.setup?).to eq(false)
    end
  end
  
  describe '#diagonal_sword?' do
    it 'returns index of best move if diagonal sword present' do
      board.cells = [" ", " ", "O", " ", "X", " ", "X", " ", " "]
      
      expect(board.diagonal_sword?).to eq(0).or eq(8)
    end
    it 'returns index of best move if diagonal sword present' do
      board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
      
      expect(board.diagonal_sword?).to eq(2).or eq(6)
    end
    it 'returns false if diagonal sword not present' do
      board.cells = [" ", " ", "O", " ", "X", " ", "O", " ", " "]
      
      expect(board.diagonal_sword?).to eq(false)
    end
  end
  
  describe '#horse_shape?' do
    it 'returns index of best move if horse shape present' do
      board.cells = ["X", " ", " ", " ", "O", "X", " ", " ", " "]
      
      expect(board.horse_shape?).to eq(2)
    end
    it 'returns index of best move if horse shape present' do
      board.cells = [" ", " ", "X", " ", "O", " ", " ", "X", " "]
      
      expect(board.horse_shape?).to eq(8)
    end
    it 'returns false if horse shape not present' do
      board.cells = ["X", " ", "O", " ", "O", "X", " ", " ", " "]
      
      expect(board.horse_shape?).to eq(false)
    end
    it 'returns false if horse shape not present' do
      board.cells = ["X", " ", " ", " ", "O", " ", " ", " ", "X"]
      
      expect(board.horse_shape?).to eq(false)
    end
  end
  
  describe '#half_cross?' do
    it 'returns true if half cross present' do
      board.cells = [" ", " ", " ", "X", "O", " ", " ", "X", " "]
      
      expect(board.half_cross?).to eq(6)
    end
    it 'returns true if half cross present' do
      board.cells = [" ", "X", " ", "X", "O", " ", " ", " ", " "]
      
      expect(board.half_cross?).to eq(0)
    end
    it 'returns true if half cross present' do
      board.cells = [" ", "O", " ", " ", "X", "O", " ", " ", " "]
      
      expect(board.half_cross?).to eq(2)
    end
    it 'returns true if half cross present' do
      board.cells = [" ", " ", " ", "X", "O", " ", "O", "X", " "]
      
      expect(board.half_cross?).to be(false)
    end
    it 'returns true if half cross present' do
      board.cells = [" ", " ", " ", "X", "O", " ", " ", " ", " "]
      
      expect(board.half_cross?).to be(false)
    end
  end
  
  describe '#diagonal_sandwich?' do
    it 'returns index of best move if diagonal_sandwich present' do
      board.cells = [" ", " ", "X", " ", "O", " ", "X", " ", " "]
      
      expect(board.diagonal_sandwich?).to eq(1).or eq(3).or eq(5).or eq(7)
    end
    it 'returns index of best move if diagonal_sandwich present' do
      board.cells = ["X", " ", " ", " ", "O", " ", " ", " ", "X"]
      
      expect(board.diagonal_sandwich?).to eq(1).or eq(3).or eq(5).or eq(7)
    end
    it 'returns false if board has other tokens other than diagonal_sandwich' do
      board.cells = [" ", "O", "X", " ", "O", " ", "X", " ", " "]
      
      expect(board.diagonal_sandwich?).to be(false)
    end
    it 'returns false if board has other tokens other than diagonal_sandwich' do
      board.cells = [" ", "O", "X", " ", "X", "O", " ", " ", " "]
      
      expect(board.diagonal_sandwich?).to be(false)
    end
    it 'returns index of best move if diagonal_sandwich present' do
      board.cells = ["X", " ", "O", " ", "O", " ", " ", " ", "X"]
      
      expect(board.diagonal_sandwich?).to eq(false)
    end
  end
  
  describe '#update' do
    it 'updates the cells in the board with the player token according to the input' do
      player = double("player", :token => "X")

      board.update("1", player)
      expect(board.position("1")).to eq("X")
    end
  end
end
