require 'pry'

class Game
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
    ]
    
    attr_accessor :board, :player_1, :player_2
    
    def initialize(p1=Players::Human.new('X'), p2=Players::Human.new('O'), b=Board.new)
      @board = b 
      @player_1 = p1
      @player_2 = p2
    end
    
    def current_player
      board.turn_count % 2 == 0 ? player_1 : player_2
    end
    
    def won?
      WIN_COMBINATIONS.detect do |combo|
        combo.all? {|i| board.cells[i] == 'X'} || combo.all? {|i| board.cells[i] == 'O'}
      end
    end
    
    def draw?
      !won? && board.full?
    end
    
    def over?
      won? || draw?
    end
    
    def winner
      board.cells[won?[0]] if won?
    end
    
    def turn
      num = current_player.move(board)
      turn unless board.update(num, current_player)
    end
    
    def play
      until over? do
        puts "Player #{current_player.token}'s turn"
        puts "Pick a number between 1-9"
        board.display
        turn
      end
      board.display
      puts "Congratulations #{winner}!" if winner
      puts "Cat's Game!" if draw?
    end
end