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
    [6,4,2]
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
  end
  
  def current_player 
    turn = @board.turn_count
    if turn.even?
      player_1
    else 
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
      @board.cells[win_array[0]] == @board.cells[win_array[1]] &&
      @board.cells[win_array[1]] == @board.cells[win_array[2]] &&
      @board.cells[win_array[0]] != " "
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end

  def winner
    winner = won?
    @board.cells[winner[0]] if winner != nil
  end
  
  def turn 
    puts "Please, choose a position between 1 - 9 and press Enter:"
    position = current_player.move(@board)
      if @board.valid_move?(position) == true
        @board.update(position,current_player)
        @board.display
      else  
        puts "This move in not valid."
        turn 
      end
  end
  
  def play 
    self.turn until self.over?
    if self.draw?
      puts "Cat's Game!" 
    else
      puts "Congratulations #{winner}!"
    end
  end
  
end

