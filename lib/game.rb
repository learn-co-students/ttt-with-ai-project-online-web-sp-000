class Game
  
  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect {|win_combo_array| 
      board.cells[win_combo_array[0]] == board.cells[win_combo_array[1]] && board.cells[win_combo_array[1]] == board.cells[win_combo_array[2]] && board.taken?(win_combo_array[0]+1)}
  end

  def draw?
   board.full? && !won?
  end
  
  def over?
    won? || board.full? || draw?
  end
  
  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    current_move = current_player.move(board)
    if board.valid_move?(current_move)
      board.update(current_move, current_player)
      board.display
    else
      turn
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def start
    puts "Welcome to Tic Tac Toe"
    play
  end
  
end
   
   
    