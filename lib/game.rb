class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @board=board
    @player_1=player_1
    @player_2=player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]
      board.cells[win_index_1]==board.cells[win_index_2]&&board.cells[win_index_3]==board.cells[win_index_2]&&board.cells[win_index_1]!=" "
    end
  end


  def draw?
    board.full?&&!won?
  end

  def over?
    draw?||won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    current_move=current_player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.display
      puts "Turn: #{board.turn_count+1}\n"
      board.update(current_move,current_player)
      puts "#{current_player.token} moved #{current_move}"
      board.display
    end
  end

  def play
    while !over?
      puts "Please input your next move"
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

#   Greet the user with a message.
# Prompt the user for what kind of game they want to play, 0,1, or 2 player.
# Ask the user for who should go first and be "X".
# Use the input to correctly initialize a Game with the appropriate player types and token values.
# When the game is over, the CLI should prompt the user if they would like to play again and allow
# them to choose a new configuration for the game as described above. If the user doesn't want to play again, exit the program.

  # def start
  #   puts "Welcome to Tic-tac-toe!"
  #   puts "what kind of game they want to play, 0,1, or 2 player, please enter 0,1,or 2 accordingly"
  #   player_number=gets until [0,1,2].include?(player_number)
  #   puts "Who should go first and be 'X'?"
  #
  #   #what do i want for user input
  #   #how to impliment two gets data in initiating the game?
  #
  #
  #
  #
  #   end

  end
