class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
    if @board.cells[0] == "X" && @board.cells[1] == "X" && @board.cells[2] == "X" || @board.cells[0] == "O" && @board.cells[1] == "O" && @board.cells[2] == "O"
      return WIN_COMBINATIONS[0]
    elsif @board.cells[3] == "X" && @board.cells[4] == "X" && @board.cells[5] == "X" || @board.cells[3] == "O" && @board.cells[4] == "O" && @board.cells[5] == "O"
      return WIN_COMBINATIONS[1]
    elsif @board.cells[6] == "X" && @board.cells[7] == "X" && @board.cells[8] == "X" || @board.cells[6] == "O" && @board.cells[7] == "O" && @board.cells[8] == "O"
      return WIN_COMBINATIONS[2]
    elsif @board.cells[0] == "X" && @board.cells[3] == "X" && @board.cells[6] == "X" || @board.cells[0] == "O" && @board.cells[3] == "O" && @board.cells[6] == "O"
      return WIN_COMBINATIONS[3]
    elsif @board.cells[1] == "X" && @board.cells[4] == "X" && @board.cells[7] == "X" || @board.cells[1] == "O" && @board.cells[4] == "O" && @board.cells[7] == "O"
      return WIN_COMBINATIONS[4]
    elsif @board.cells[2] == "X" && @board.cells[5] == "X" && @board.cells[8] == "X" || @board.cells[2] == "O" && @board.cells[5] == "O" && @board.cells[8] == "O"
      return WIN_COMBINATIONS[5]
    elsif @board.cells[0] == "X" && @board.cells[4] == "X" && @board.cells[8] == "X" || @board.cells[0] == "O" && @board.cells[4] == "O" && @board.cells[8] == "O"
      return WIN_COMBINATIONS[6]
    elsif @board.cells[2] == "X" && @board.cells[4] == "X" && @board.cells[6] == "X" || @board.cells[2] == "O" && @board.cells[4] == "O" && @board.cells[6] == "O"
      return WIN_COMBINATIONS[7]
    else
      return false
    end
  end
  
  def draw?
    if @board.full? == true && won? == false
      true
    elsif @board.full? == false && won? == true
      true
    else
      false
    end
  end
  
  def over?
    if draw? == true || won? != false
      true
    elsif draw? == false && won? == false
      false
    end
  end
  
  def winner
    if won? == false
      nil
    else
      winning_array = won?
      winning_array_int = winning_array[0].to_i
      if @board.cells[winning_array_int] == player_1.token
        player_1.token
      elsif @board.cells[winning_array_int] == player_2.token
        player_2.token
      end
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input.to_i
    if @board.valid_move?(index)
      @board.update(index, current_player)
      @board.display
    else
      turn
    end
  end
    
end