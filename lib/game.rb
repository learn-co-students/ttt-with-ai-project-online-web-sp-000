require_relative './players/human'
class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  include Players
  attr_accessor :board, :player_1, :player_2


  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    a = self.board.turn_count.even? ? player_1 : player_2

  end


  def won?
    result_x = nil
    result_o = nil
    final_result = nil

    WIN_COMBINATIONS.each do |win_combo|
      win = win_combo.all?{|index| self.board.cells[index] == "X"}
      win ? result_x = win_combo : result_x
    end

    WIN_COMBINATIONS.each do |win_combo|
      win = win_combo.all?{|index| self.board.cells[index] == "O"}
      win ? result_o = win_combo : result_o
    end

    if !result_x
       final_result = result_o
     elsif !result_o
       final_result = result_x
     else
       final_result
     end
   end

   def draw?
     self.board.full? && !self.won? ? true : false
   end

   def over?
     self.draw? || self.won? ? true : false
   end

   def winner
     result = nil
     won? ? result = self.board.cells[won?.first] : result
   end

   def turn
     input = current_player.move(self.board)
     if self.board.valid_move?(input)
       self.board.cells[input.to_i - 1] = current_player.token
     else
       puts "invalid"
       turn
     end
   end

   def play
      turn until over?
      if won? && winner == "X"
         puts "Congratulations X!"
       elsif won? && winner == "O"
         puts "Congratulations O!"
       else
         puts "Cat's Game!"
       end
   end

end
