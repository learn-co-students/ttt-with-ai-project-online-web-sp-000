class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]  
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count.even? 
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect { |combo| 
      @board.cells[combo[0]] == @board.cells[combo[1]] && 
      @board.cells[combo[1]] == @board.cells[combo[2]] && 
      @board.taken?(combo[0] + 1)
    }
  end
 
  def draw?
    if @board.full? && !won?
      return true
    else 
      return false
    end  
  end
 
  def winner
    if combo = won?
      @board.cells[combo[0]] # <-- this is the first index of the winning combo and whatever "input" is on the board at this index, it will return as the winner
    end
  end
  
  def over?
   over = false
     if draw? || won?
        over = true
      end
  end
  
  def start 
    
  end
  
  def play 
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
        elsif draw?
          puts"Cat's Game!"
      end
  end 
  
  def turn
    current_move = current_player.move(board)
      if @board.valid_move?(current_move)
          @board.update(current_move, current_player) 
          @board.display
        else 
          turn
        end
    end
  end