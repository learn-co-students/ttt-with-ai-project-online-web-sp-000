class Game
  attr_accessor :board, :player_1, :player_2, :winner
 
  WIN_COMBINATIONS = [
    [0, 1, 2], #Top row
    [3, 4, 5], #Middle row
    [6, 7, 8], #Bottom row
    [0, 3, 6], #First Column
    [1, 4, 7], #Second Column
    [2, 5, 8], #Third Column
    [0, 4, 8], #Diagonal left to right
    [2, 4, 6], #Diagonal right to left
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end 

  def won?
    # winning_array = []
    # # binding.pry

    # WIN_COMBINATIONS.each do |combo|
    #   board_values = []
    #   combo.each do |position_value|
    #     board_values.push(@board.cells[position_value]) 
    #     #puts "the current board value is #{board_values}"     
    #   end
    #   if board_values.all?{|values| values == "X" }|| board_values.all?{|values| values == "O"}
    #     winning_array = combo
    #   end
    # end
    # winning_array == [] ? false : winning_array
    WIN_COMBINATIONS.detect do |winner|
      # binding.pry
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
      (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
  end

  def draw?
    !won? && @board.full? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner  
    # if won?
    #   winning_index = won?[0]
    #   @board.cells[winning_index]
    # end
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    board.display
    player = current_player
    player_move = player.move(@board)
    # binding.pry  
    if @board.valid_move?(player_move)
    # binding.pry
      @board.update(player_move, player)
    else
      turn
    end
  end

  def play
    # binding.pry
    until over? == true
      turn
    end

    if won?
      winner_name = winner
      board.display      
      puts "Congratulations #{winner_name}!"
    elsif draw?
      board.display
      puts "Cat's Game!"
    end
  end
end