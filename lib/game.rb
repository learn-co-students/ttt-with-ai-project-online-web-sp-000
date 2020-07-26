class Game

attr_accessor :board, :player_1, :player_2



  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
 ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),
    board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |wc|
    board.cells[wc[0]] == board.cells[wc[1]] &&
    board.cells[wc[0]] == board.cells[wc[2]] &&
    board.taken?(wc[0]+1)
    end
  end

  def draw?
    board.turn_count == 9 && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def over?
    draw? || won?
  end

  def turn
    board.display
    current_move = current_player.move(board)
    if !board.valid_move?(current_move)
      puts "Invalid move! Please make another selection."
      turn
    else
      board.update(current_move, current_player)
    end
  end


   def play
      while !over?
        turn
      end
      if won?
        board.display
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
   end







end
