require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

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
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  
  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
    win1=combination[0]
    win2=combination[1]
    win3=combination[2]

    @board.cells[win1] == @board.cells[win2] && @board.cells[win2] == @board.cells[win3] && @board.cells[win1] != " "
    end  
  end
  
  def draw?
    if !won? && @board.full?
      return true
      elsif !won? && !@board.full?
      return false
      elsif won?
      return false
    end 
  end
  
  def over?
    if won?
    return true
    elsif draw?
      return true
    elsif @board.full?
      return true
    end
  end
  
  def winner
  win_combination=won?
    if win_combination
    winning_location=win_combination[0]
    @board.cells[winning_location]
     else
     nil
    end
  end
  
  def turn
    
    puts "It's now #{current_player.token}'s turn."
    input = current_player.move(input).to_i
    
    if !@board.valid_move?(input.to_s)
      turn
    
    
    
    end

    
  end
end

=begin

  def update(user_input,current_player)
    if valid_move?(user_input)
      @cells[user_input.to_i - 1] = current_player.token
    end
  end

  describe 'turn' do
    it 'makes valid moves' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("1")

      game.turn
    end

    it 'asks for input again after a failed validation' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("invalid")
      expect(game.player_1).to receive(:gets).and_return("1")

      game.turn
    end

    it 'changes to player 2 after the first turn' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("1")
      expect(game.player_2).to receive(:gets).and_return("2")

      game.turn
      game.turn
    end
  end

  describe 'play' do
    it 'asks for players input on a turn of the game' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game).to receive(:over?).and_return(false, true)

      expect(game.player_1).to receive(:gets).at_least(:once).and_return("1")

      game.play
    end

    it 'checks if the game is over after every turn' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2")
      allow(game.player_2).to receive(:gets).and_return("4", "5")

      expect(game).to receive(:over?).at_least(:twice).and_return(false, false, true)

      game.play
    end

    it 'plays the first turn of the game' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1")

      allow(game).to receive(:over?).and_return(false, true)

      game.play

      expect(game.board.cells).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'plays the first few turns of the game' do
      game = Game.new

      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2")
      allow(game.player_2).to receive(:gets).and_return("4")

      allow(game).to receive(:over?).and_return(false, false, false, true)

      game.play

      expect(game.board.cells).to eq(["X", "X", " ", "O", " ", " ", " ", " ", " "])
    end

    it 'checks if the game is won after every turn' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2", "3")
      allow(game.player_2).to receive(:gets).and_return("4", "5", "6")
      allow(game).to receive(:winner).and_return("X")

      expect(game).to receive(:won?).at_least(:twice).and_return(false, false, true)

      game.play
    end

    it 'checks if the game is a draw after every turn' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2")
      allow(game.player_2).to receive(:gets).and_return("3", "4")

      expect(game).to receive(:draw?).at_least(:twice).and_return(false, false, true)

      game.play
    end

    it 'stops playing if someone has won' do
      game = Game.new
      game.board.cells = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

      allow($stdout).to receive(:puts)

      expect(game).to_not receive(:turn)

      game.play
    end

    it 'congratulates the winner X' do
      game = Game.new
      game.board.cells = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
      allow($stdout).to receive(:puts)

      expect($stdout).to receive(:puts).with("Congratulations X!")

      game.play
    end

    it 'congratulates the winner O' do
      game = Game.new
      game.board.cells = [" ", " ", " ", " ", " ", " ", "O", "O", "O"]

      allow($stdout).to receive(:puts)

      expect($stdout).to receive(:puts).with("Congratulations O!")

      game.play
    end

    it 'stops playing in a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      allow($stdout).to receive(:puts)

      expect(game).to_not receive(:turn)

      game.play
    end

    it 'prints "Cat\'s Game!" on a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      allow($stdout).to receive(:puts)

      expect($stdout).to receive(:puts).with("Cat's Game!")

      game.play
    end

    it 'plays through an entire game' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("1")
      expect(game.player_2).to receive(:gets).and_return("2")
      expect(game.player_1).to receive(:gets).and_return("3")
      expect(game.player_2).to receive(:gets).and_return("4")
      expect(game.player_1).to receive(:gets).and_return("5")
      expect(game.player_2).to receive(:gets).and_return("6")
      expect(game.player_1).to receive(:gets).and_return("7")

      expect($stdout).to receive(:puts).with("Congratulations X!")

      game.play
    end
  end

  describe 'start' do
  end
end


=end