class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0, 1, 2], [1, 4, 7], [2, 5, 8], [0, 3, 6], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1_oi = Players::Human.new("X"), player_2_oi = Players::Human.new("O"), board_oi = Board.new)
    @board = board_oi
    @player_1 = player_1_oi
    @player_2 = player_2_oi
  end
    
  def board
    @board
  end
  
  def player_1
    @player_1
  end 
  
  def player_2
    @player_2
  end 
  
  def current_player                                          #returns the player object instace, not the token
    @board.turn_count % 2 == 0? @player_1 : @player_2         #why player_instance.token doesnt work?
  end
  
  def won?
    WIN_COMBINATIONS.detect do |i|
      @board.cells[i[0]] == @board.cells[i[1]] && @board.cells[i[2]] == @board.cells[i[1]] && @board.cells[i[0]] != " " #taken? doesnt work?
    end
  end
  
  def draw?
    !won? && @board.turn_count == 9
  end
  
  def over?
    draw? || won?
    # !(@board.turn_count != 9) ======> DO NOT USE THIS, it keeps it in the loop ***
  end
  
  def winner
    won?? @board.cells[won?[0]] : nil
  end
    
  def turn
    puts "Please enter a number between 1-9"
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input, current_player)
      @board.display
    end
  end

  def play
    turn while !over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
    
end