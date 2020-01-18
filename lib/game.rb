class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        if(self.board.turn_count.even?)
            player_1
        else
            player_2
        end
    end

    def won?
        WIN_COMBINATIONS.find{|win_combo| 
            self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && 
            self.board.cells[win_combo[1]] == self.board.cells[win_combo[2]] &&
            (self.board.cells[win_combo[0]] == "X" || self.board.cells[win_combo[0]] == "O")
        }
    end

    def draw?
        self.board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won? 
            self.board.cells[won?[0]]
        end
    end

    def turn
        input = current_player.move(self.board)
        if self.board.valid_move?(input)
            self.board.update(input, current_player)
        else puts "Please enter a number 1-9:"
            self.board.display
            turn
        end
        
        self.board.display
    end

    def play
        turn until over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end