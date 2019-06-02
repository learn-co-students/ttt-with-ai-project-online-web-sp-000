require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]].freeze

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    return WIN_COMBINATIONS.find { |combo| x_wins?(combo) || o_wins?(combo) } unless nil
  end

  def full?
   board.cells.all?{|element| element != " " && element != "" && element != nil }
  end

  def draw?
    if full? && !won?
      return true
    else
      return nil
    end
  end

  def over?
    return true if draw? || (won? && full?) || (won? && !full?)
  end

  def winner
   if x_wins?(won?) 
    return "X"
   elsif o_wins?(won?)
    return "O"
   else
    return won?
   end
  end

  def turn
    player_choice = current_player.move(board)
    while !board.valid_move?(player_choice)
      player_choice = current_player.move(board)
    end
    board.update(player_choice, current_player) 
  end

  def play
    while !over?
      turn
      board.display
    end
      
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      else
        puts "Cat's Game!"
      end
  end


  private

  #return true if all x's combination win
  def x_wins?(combo)
    if combo.nil?
      return nil
    else
      combo.all?{|index_combo| board.cells[index_combo.to_i] == "X"}
    end 
  end


  #return true if all o's combination win
  def o_wins?(combo)
    if combo.nil?
      return nil
    else
    combo.all?{|index_combo| board.cells[index_combo.to_i] == "O"}  
    end
  end
end