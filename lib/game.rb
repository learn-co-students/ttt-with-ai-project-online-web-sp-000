class Game

include Players
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
    def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new) #=Array.new(9, " ")
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end
    
    def current_player
        if self.board.turn_count % 2 == 0
            self.player_1
        else
            self.player_2
        end
    end
    
    def won?
        WIN_COMBINATIONS.find do |combo|
            self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
            self.board.cells[combo[0]] == self.board.cells[combo[2]] &&
            self.board.taken?(combo[0])
        end
    end
    
    def draw?
        self.board.turn_count == 9 && !won?
    end
    
    def over?
        return true if won? || draw? || self.board.full?
    end
    
    def winner
        return self.board.cells[won?[0]] if won?
    end
    

    def turn
       mymove = self.current_player.move(self.board)
       if !self.board.valid_move?(mymove)
           turn
        else
            self.board.update(mymove, self.current_player)
       end
    end
    

    
    #      def play
    #      while !over?
    #          turn
    #      end
    #   if draw?
    #       puts "Cat's Game!"
    #   elsif won?
    #       puts "Congratulations #{winner}!"
    #   end
    #   end
    
end









