require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :cells, :token

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Players::Human.new(token = "X"), player_2 = Players::Human.new(token = "O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
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

  def current_player #tells who the current plater is
    if @board.turn_count.odd? == true
        current_player = player_2
        # next_up = player_1# e.g 1 - x goes first
    elsif @board.turn_count.even? == true
      current_player = player_1
        # next_up = player_2  #eg 2 - O goes second
    end
  end

  def won? # true if someone won the game
    WIN_COMBINATIONS.each do |win_combination|

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if @board.cells.any?{|index| index == "X" || index == "O"}
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      else
       return false
      end
    end
    return false
  end

  def full?
    if @board.cells.all?{|index| index == "X" || index == "O"}
      return true
    elsif @board.cells.any?{|index| index == "X" || index == "O"}
      return false
    else return false
    end
  end

  def draw? #are all the cells full but there is no winner?
    if won? == false and full? == true
      return true
    else
     return false
    end
  end

  def over? #is the game over?
    if won? != false or draw? == true or full? == true
      return true
    else
      return false
    end
  end

  def winner #who is the winner
    if won? != false

      xcount = 0
      ocount = 0

      xcount += @board.cells.select{|index| index == "X"}.length()
      ocount += @board.cells.select{|index| index == "O"}.length()

      if xcount > ocount
        return "X"
      elsif ocount >= xcount
        return "O"
      end
    end
  end

  def turn #take a turn
    move = current_player.move(board)  #move = input
    if @board.valid_move?(move)  #if it is a valit input
      @board.update(move, current_player) #update the board
      @board.display #show the new board
    else
      turn
    end
  end

  def play #play the game
    while over? == false  #if the game is not over
      turn  #take a turn
    end

    if won? != false #if the game has been won
      puts "Congratulations " + winner + "!" #puts congrats winner
    elsif draw? == true #if the game is a draw
      puts "Cat's Game!" #puts cats game
    end
  end

end
