require 'pry'
#Game class is the main model of the application and represents a singular instance of a Tic-tac-toe session.
class Game
  attr_accessor :board, :player_1, :player_2           #provides access to the board, player_1, player_2

  WIN_COMBINATIONS = [            #Defined class Constant array
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [6, 4, 2]
  ]
  #Human class, has to be called inside its name space with Players::Human
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #returns the correct player, X, for the third move
  def current_player
    board.turn_count.even?  ? player_1 : player_2         #call to #turn_count & #even? on it. Ternary Operator
  end

  #returns false for a draw with #find method
  #returns the correct winning combination in the case of a win
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?
    board.full? && !won?              #calling #full? on board class
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?        #return X when X won and vice versa
  end
  def turn
    player = current_player
    current_move = player.move(@board)    #calls Human Class #move method
    if !@board.valid_move?(current_move)  #if not a valid move
      puts "That's not a valid move. Pick an available number please.\n\n"
      return turn                         #turn again
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved to position #{current_move}"
      @board.display
      puts "\n"                           #for spacing in CLI
    end
  end

  def play                                #asks for players input on a turn of the game
    turn until over?                        #checks if game is over after every turn (logically if not won? or draw? not over) look at #over? method
    if won?                               #stops playing if someone has won
      puts "Congratulations #{winner}!"    #Congratulations winner with mass assignment
    elsif draw?
      puts "Cat's Game!"                                      #prints "Cat\'s Game!" on a draw
    end
  end

  def start
    puts "Welcome to Command Line Tic Tac Toe!\n\n"
    puts "What type of game would you like to play? Please choose a game mode:"
    puts "Type 0 - You vs. Computer"
    puts "Type 1 - You vs. Human"
    puts "Type 2 - Computer vs. Computer"

    game_mode = gets.strip
    if game_mode == "0"
      puts "Do you want to go first? (y/n)"
      if gets.strip == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
      end
    end

    if game_mode == "1"
      #puts "Do you want to go first? (y/n)"                      #Not necessary when playing a human
      if gets.strip == "y"
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
      else
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
      end
    end

    if game_mode == "2"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    end
  end
end
