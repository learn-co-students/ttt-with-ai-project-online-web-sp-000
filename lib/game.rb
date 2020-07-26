class Game
  
  attr_accessor :board, :player_1, :player_2
  
  @@all = []
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
    self.save
  end 
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self 
  end 
  
  def current_player
    board.turn_count.even? ? self.player_1 : self.player_2
  end 
  
  def winning_combo
    WIN_COMBINATIONS.find{|combo| self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.cells[combo[2]] != " "}
  end
  
  def won?
    winning_combo != nil ? winning_combo : false 
  end 
  
  def draw?
    self.board.full? && !self.won? ? true : false 
  end 
  
  def over?
    self.won? || self.draw? ? true : false
  end 
  
  def winner
    self.won? ? self.board.cells[self.winning_combo[0]] : nil 
  end 
  
  def turn
    input = self.current_player.move(board)
    self.board.valid_move?(input) ? self.board.update(input, self.current_player) : self.turn 
  end  
  
  def play 
    until self.over? do 
      self.turn 
      self.board.display
    end 
    if self.over? 
      if self.won? 
        puts "Congratulations #{self.winner}!"
        self.restart 
      else 
        puts "Cat's Game!"
        self.restart 
      end 
    end 
  end 
  
  def restart
    puts "Would you like to play again?"
    answer = gets.strip
    if answer == "yes"
      self.board.reset!
      self.start 
      self.play 
    elsif answer != "yes" && answer != "no"
      puts "It's a yes or no answer, smart-ass!"
      self.restart 
    end 
  end 
  
  def welcome 
    puts "Welcome to Tic-Tac-Toe!"
  end 
  
  def start 
    puts "Please, choose the number of human players from: 0, 1, or 2."
    num_of_players = gets.strip 
    case num_of_players
    when "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    when "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    when "wargames" 
      puts "dfsds"
    else 
      puts "Invalid number of players, try again!"
      self.start 
    end 
  end 
  
end 