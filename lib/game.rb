class Game 
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2 
    @board = board
  end 
  
  def current_player 
    if @board.turn_count % 2 == 1 
      @player_2
    else 
      @player_1
    end
  end 
  
  def won? 
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo| 
      if @board.cells[combo[0]] == @board.cells[combo[1]]
        if @board.cells[combo[1]] == @board.cells[combo[2]]
          if @board.cells[combo[0]] != " "
            winning_combo = combo
          end 
        end 
      end 
    end 
    winning_combo
  end 
  
  def draw? 
    !won? && @board.full?
  end 
  
  def over? 
    won? || draw?
  end
  
  def winner

    if over?
      if draw? 
        winner = nil
      elsif won?
        winning_combo = won?
        if @board.cells[winning_combo[0]] == "X"
          winner = "X"
        else 
          winner = "O"
        end
      end
      winner
    end
  end
  
  def turn 
    @board.display
    player = current_player
    possible_move = player.move(@board)
    if @board.valid_move?(possible_move)
      @board.update(possible_move, player)
    else
      until @board.valid_move?(possible_move)
        puts "invalid"
        possible_move = player.move(@board)
      end
    end
  end
  
  def play 
    while !over? 
      turn 
    end
    if draw?
      @board.display
      puts "Cat's Game!"
    else 
      @board.display
      puts "Congratulations #{winner}!"
    end 
  end 
  
end