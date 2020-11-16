require 'pry'

class Game
  
  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
  end 
  
  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def self.win_combo
    WIN_COMBINATIONS
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] && 
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] && board.cells[win_combo[0]] != " "
    end
  end
  
  def draw?
    @board.full? && !won? 
  end
  
  def over?
     won? || draw?
  end
  
  def winner
    @board.cells[won?[0]] if won?
  end
  
  def turn
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else puts "Please enter 1-9:"
      turn
      @board.display
    end
     @board.display
  end
  
  
  def play
    until over?
      turn
      sleep(0.25)
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
  
  def wargame
    game_counter = 0 
    x_wins = 0
    o_wins = 0
    draws = 0
    until game_counter == 100
    game_counter += 1
      play
      puts game_counter
      if winner == 'X'
        x_wins += 1
      elsif winner == '0'
        o_wins += 1
      else draw?
        draws += 1
      end
    end
    puts "Wargame Concluded!"
    puts "X won #{x_wins} times!"
    puts "O won #{o_wins} times!"
    puts "#{draws} Draws!"
    puts "NOBODY WINS IN WAR!!"
    
  end
  
  
end