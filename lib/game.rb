class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X") || (@board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O")
    end
  end

  def full?
    @board.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      return @board.cells[won?[0]]
    else
      return nil
    end
  end
  
  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
    @board.display
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def self.start
    puts "What kind of game you'd like to play: "
    puts "0, 1 or 2 players?"
    input = gets.chomp
  
    case input
      when "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      when "1"
        choice = ""
        until choice == "AI" || choice == "human" do
          puts "Who should go first and be 'X': 'AI' or 'human'?"
          choice = gets.chomp
        end
        if choice == "AI"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        else
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        end
      when "2"
        game = Game.new
      else
        puts "Sorry, I didn't get it!"
        puts "Let's start all over.\n\t"
        start
      end
    game.play
    
    answer = ""
    until answer == "yes" || answer == "no" do
      puts "Would you like to play again?"
      puts "yes/no?"
      answer = gets.chomp
    end
    start if answer == "yes"
  end
end