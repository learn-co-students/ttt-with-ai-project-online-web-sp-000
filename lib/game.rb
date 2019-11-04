class Game
  attr_accessor :board, :player_1, :player_2
  
   WIN_COMBINATIONS = [
  
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left to right diagnol
  [2,4,6], #Right to left diagnol
  
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
      (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end
  
  def turn
    puts "It's #{self.current_player.token}'s turn. Please enter location:"
    x = current_player.move(board)
    if @board.valid_move?(x)
      @board.update(x,current_player)
    else
      turn
    end
    @board.display
  end
  
  def play
    while !self.over?
    self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
  
  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players are playing? (0, 1 or 2)"
    answer = gets.chomp
    case answer
    when "0"
      puts "Enjoy the game between 2 Computers"
      @player_1 = Players::Computer.new("X")
      @player_1.board = self.board
      @player_2 = Players::Computer.new("O")
      @player_2.board = self.board
      self.play
    when "1"
      puts "Choose your side: X or O"
      side = gets.chomp
      if side == "X"
        @player_2 = Players::Computer.new("O")
        @player_2.board = self.board
      elsif side == "O"
        @player_1 = Players::Computer.new("X")
        @player_1.board = self.board
      else
        puts "Invalid entry. Game restarting..."
        self.start  
      end
      puts "Game starting..."
      @board.display
      self.play
    when "2"
      puts "Let's begin"
      self.play
    else
      puts "Invalid entry. Game restarting..."
      self.start
    end
  end
  
end