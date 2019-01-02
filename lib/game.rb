class Game
 attr_accessor :board, :player_1, :player_2

 def initialize(player_1 = nil, player_2 = nil, board = nil)
   @player_1 = player_1 || Players::Human.new("X")
   @player_2 = player_2 || Players::Human.new("O")
   @board = board || Board.new
 end

 def current_player
   @board.turn_count % 2 == 0 ? player_1 : player_2
 end

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

 def won?
   WIN_COMBINATIONS.find do |win_combo|
     win_1 = @board.cells[win_combo[0]]
     win_2 = @board.cells[win_combo[1]]
     win_3 = @board.cells[win_combo[2]]
     (win_1 == "X" && win_2 == "X" && win_3 == "X") || (win_1 == "O" && win_2 == "O" && win_3 == "O")
   end
 end

def draw?
  @board.full? && !won?
end

def over?
  draw? || won?
end

def winner
  combo = won?
    if combo
      @board.cells[combo[0]]
    end
  end

  def turn
    player = current_player
    move = player.move(board)

    if board.valid_move?(move)
      board.update(move,player)
    else
      puts "try again. you know the rules"
      turn
    end
  end

  def play
    until over?
      turn
    end

    @board.display

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end




 end
