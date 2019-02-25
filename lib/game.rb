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
      # binding.pry
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
      elsif @board.cells[win_comb_1] == "O" && @board.cells[win_comb_2] == "O" && @board.cells[win_comb_3] == "O"
        @the_win_ary << win_comb_1
        @the_win_ary << win_comb_2
        @the_win_ary << win_comb_3
        return "O"
      end
    end
    return nil
  end
  
  def turn 
    puts "#{self.current_player.token} please enter 1 - 9"
    input = self.current_player.move(board)
    if @board.valid_move?(input)
       @board.update(input, self.current_player)
       @board.display
    else
      input_2 = gets.strip
      self.current_player.move(input_2)
    end
  end
  
  def play
    until self.over?
    self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
  
  def start 
    puts "Welcome to Tic Tac Toe"
    puts "Please select the number of players...0, 1, or 2"
    input = gets.strip
    if input == "2"
    puts "2-Player Game!"
    board.display
    puts "Player 1 is 'X',  Player 2 is 'O'"
    play
    elsif input == "1"
    puts "1-Player Game!"
    one_player
    board.display
    puts "Player 1 is 'X',  Computer is 'O'"
    play
    elsif input == "0"
    puts "Enjoy this game by the computer"
    zero_player
    board.display
    play
    end
  end
  
  def one_player
    @player_2 = Players::Computer.new("O")
  end
  
  def zero_player
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Computer.new("O")
  end
  
 
 
end