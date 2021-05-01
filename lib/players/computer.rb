require 'pry'
module Players

  class Computer < Player
    attr_reader :winning_cells
    
    def move(board)
      opponent_token = Player.all.detect {|p| p != self}.token
      
      near_win = Game.wins.detect do |win|
        @winning_cells = [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]]
        winning_cells.count(opponent_token) == 2 && winning_cells.count(" ") == 1
      end   
      
      open_corner = [0, 2, 6, 8].detect {|i| board.cells[i] == " "}
      
      if near_win
        near_win[winning_cells.index(" ")] + 1.to_s
      elsif board.cells[4] == " "
        5.to_s
      elsif open_corner
        open_corner + 1.to_s
      else
        rand(1..9).to_s
      end
    end
  end
end

