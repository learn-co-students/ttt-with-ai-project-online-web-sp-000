require "pry"

class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [0,4,8]]
  
  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O") , board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count % 2 == 0 
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    if self.winner == "X" || self.winner == "O"
      return @the_win_ary
     
    end
  end
  
  def draw?
    if @board.full? && !self.won?
      return true 
    end
  end
  
  def over?
    if self.draw? || self.won?
      return true 
    end
  end
      
  
  def winner
    @the_win_ary = []
    WIN_COMBINATIONS.each do |combo|
      win_comb_1 = combo[0]
      win_comb_2 = combo[1]
      win_comb_3 = combo[2]
    
      if @board.cells[win_comb_1] == "X" && @board.cells[win_comb_2] == "X" && @board.cells[win_comb_3] == "X"
        @the_win_ary << win_comb_1
        @the_win_ary << win_comb_2
        @the_win_ary << win_comb_3
        return "X"
      elsif@board.cells[win_comb_1] == "O" && @board.cells[win_comb_2] == "O" && @board.cells[win_comb_3] == "O"
        @the_win_ary << win_comb_1
        @the_win_ary << win_comb_2
        @the_win_ary << win_comb_3
        return "O"
      end
    end
    return nil
  end
  
  def turn 
    user_input = gets.strip
    the_move = self.current_player.move(user_input)
    if @board.valid_move?(the_move)
       @board.update(the_move, self.current_player)
    else
      input_2 = gets.strip
      self.current_player.move(input_2)
    end
  end
  
  def play
    until self.over?
    first_input = gets.strip
    self.current_player.move(first_input)
    self.over?
    self.turn
    # second_input = gets.strip
    # self.current_player.move(second_input)
    binding.pry
    self.over?
    end
  end
  
end