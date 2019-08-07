
class Game

    WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,4,8], [2,4,6],
    [0,3,6], [1,4,7], [2,5,8],
    ]

attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      @board.cells[index_1] == @board.cells[index_2] &&
      @board.cells[index_2] == @board.cells[index_3] &&
      @board.taken?(index_1 + 1)
      end
    end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if win = won?
      @board.cells[win.first]
    end
  end

  def turn
    user_input = current_player.move(board)
  if @board.valid_move?(user_input)
    @board.update(user_input, current_player)
    @board.display
  else
 puts "Please enter a valid move"
    turn
  end
end

  def play
    while !over?
      turn
      draw?
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic-tac-toe!"
    puts "How would you like to play?"
    puts "0 = 0-player game has two computer players playing against each other with no interaction from the user."
    puts "1 = 1-player game has a human playing against a computer."
    puts "2 = 2-player game has two human players."
    puts "Please select a number (0,1,2) "
    input = gets.strip.to_i
    if input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      game.play
    elsif input == "1"
      puts "Choose token: X or O:"
      token = gets.strip.upcase
      if token == "X"
        game = Game.new(Players::Human.new(token), Players::Computer.new("O"))
        game.play
      elsif token == "O"
        game = Game.new(Players::Human.new(token), Players::Computer.new("X"))
        game.play
      else
        puts "Please choose an X or O token only."
        start
        end
      elsif input == "2"
        puts "Choose token: X or O for player 1:"
        token - gets.strip.upcase
      if token == "X"
        game = Game.new(Players::Human.new(token), Players::Human.new("O"))
        game.play
      elsif token == "O"
        game = Game.new(Players::Human.new(token), Players::Human.new("X"))
        game.play
      else
        puts "Please choose an X or O token only."
        start
        end
      else
      puts "Invalid input"
      start
      end
    end

    def play_again
      puts "Play again? y/n:"
      input = gets.strip.upcase
    if input == "Y"
      self.start
    elsif input == "N"
      exit
    else
      play_again
    end
  end
end
