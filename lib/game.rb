require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
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
  
  def board
    board = @board
  end
  
  def player_1
    @player_1
  end
  
  def player_2
    @player_2
  end
  
  def current_player
     if board.turn_count.even?
      @player_1
    else 
     @player_2
  end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
          
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
        return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end
  
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    if winner = won?
      @board.cells[winner.first]
  end
end

  
  def turn
  player = current_player
  current_move = player.move(@board)
  if !@board.valid_move?(current_move) #if it's not a valid move, try again
    turn
  else #if it is a valid move
    puts "Turn: #{@board.turn_count+1}\n"
    @board.display
    @board.update(current_move, player)
    puts "#{player.token} moved #{current_move}"
    @board.display
  end
  end
  

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
  end
  end
  
end