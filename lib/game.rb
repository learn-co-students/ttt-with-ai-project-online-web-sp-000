class Game
  attr_accessor :player_1, :player_2, :board
  def initialize(player1=nil, player2=nil, board=nil)
    if(player1)
      @player_1 = player1
    else 
      @player_1 = Players::Human.new("X") 
    end 
    if(player2)
      @player_2 = player2
    else 
      @player_2 = Players::Human.new("O")
    end 
    if(board)
      @board = board   
    else 
      @board = Board.new 
    end 
  end 
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  def current_player 
    @board.turn_count.even? ? @player_1 : @player_2 
  end 
  def board 
    @board 
  end 
  def draw?
    @board.cells.full? && !won?
  end
  def won? 
    WIN_COMBINATIONS.any? do |combo|
      if @board.cells.taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
      return combo
      else
        return false 
      end
    end 
  end 
  def winner
   if combo = won?
     @board.cells[combo[0]]
    end
    else 
      return nil
    end 
  end 
  def start 
  end 
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  def turn 
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end 
  def over?
    won? || draw?
  end
end 
# describe '#won?' do [] not working for object 
#     