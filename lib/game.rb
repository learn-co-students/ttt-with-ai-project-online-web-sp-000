require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_1.game = self
    @player_2 = player_2
    @player_2.game = self
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    x_win = WIN_COMBINATIONS.detect{|combo| combo.all?{|index| @board.cells[index] == "X"}}
    x_win ? x_win : WIN_COMBINATIONS.detect{|combo| combo.all?{|index| @board.cells[index] == "O"}}
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    input = ""
    until @board.valid_move?(input) do
      input = current_player.move(@board)
    end
    @board.update(input,current_player)
    @board.display
  end

  def play
    until over?
      turn
      sleep(2)
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
end

def start(input)
  case input
  when 0
    puts "Now commencing game Computer vs Computer..."
    Game.new(Players::Computer.new("X"),Players::Computer.new("O")).play
  when 1
    puts "Great! Please enter your name."
    name = gets.strip
    puts "Thank you #{name}! The first player to move is X and the second player to move is O."
    puts "Please enter either X or O to tell me your preference."
    token = gets.strip
    until token == "X" || token == "O" do
      puts "Oops! I think you mistyped. Please enter X or O."
      token.clear
      token = gets.strip
    end
    puts "Now commencing game #{name} vs Computer..."
    if token == "X"
      name = Players::Human.new("X")
      Game.new(name,Players::Computer.new("O")).play
    else
      name = Players::Human.new("O")
      Game.new(Players::Computer.new("X"),name).play
    end
  when 2
    puts "Great! Please enter the name of the player who would like to go first and be X."
    name_1 = gets.strip
    puts "Thank you #{name_1}! Now please enter the name of player 2 who will be O."
    name_2 = gets.strip
    puts "Thank you #{name_2}. Now commencing game #{name_1} vs #{name_2}..."
    name_1 = Players::Human.new("X")
    name_2 = Players::Human.new("O")
    Game.new(name_1,name_2).play
  end
end
end
