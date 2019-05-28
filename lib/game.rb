class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  
  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    self.board = board
  end
  
  def board
    @board
  end
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all? {|win_index| self.board.cells[win_index] == "X"} ||   combination.all? {|win_index| self.board.cells[win_index] == "O"}
    end
  end
  
  def draw?
    self.board.full? && !won?
  end
  
  def over?
    self.won? || self.draw?
  end
  
  def winner
    self.board.cells[won?[0]] if won?
  end
  
  def play 
    until self.over? do
      self.turn
    end
    self.board.display
    puts  "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end
  
  def turn(invalid_input = false)
    self.board.display
    puts invalid_input ? "That space is taken or the input is invalid! Please enter 1-9:" : "Please enter 1-9:"
    user_input = current_player.move(self.board)
    self.board.valid_move?(user_input) ? self.board.update(user_input, current_player) : turn(true)
  end
  
  def self.start
    game_type = self.choose_game_type
    starting_token = self.choose_starting_token
    players = self.create_players(game_type, starting_token)
    game = self.new(players[0], players[1])
    game.play
    puts "Would you like to play again? Y/N"
    if gets.strip == "Y"
      Game.start 
    end
  end
  
  def self.choose_game_type
      puts "Type '0' for Computer vs. Computer"
      puts "Type '1' for Player vs. Computer"
      puts "Type '2' for Player vs. Player"
      game_type = gets.strip 
      game_type == "0" || game_type == "1" || game_type == "2" ? game_type : self.choose_game_type
  end
  
  def self.choose_starting_token
      puts "Who should go first? 'X' or 'O'?"
      starting_token = gets.strip
      starting_token == "X" || starting_token == "O" ? starting_token : self.choose_starting_token
  end
  
  def self.create_players(game_type, starting_token)
    case game_type
    when "0" 
      [Players::Computer.new(starting_token), Players::Computer.new(self.get_other_token(starting_token))]
    when"1"
      [Players::Human.new(starting_token), Players::Computer.new(self.get_other_token(starting_token))]
    when "2"
      [Players::Human.new(starting_token), Players::Human.new(self.get_other_token(starting_token))]
    end
  end
  
  def self.get_other_token(starting_token)
    starting_token == "X" ? "O" : "X"
  end
end