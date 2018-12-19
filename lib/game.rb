class Game
    
    attr_accessor :board, :player_1, :player_2

    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    
    WIN_COMBINATIONS= [
        [0, 1, 2], #top row
        [3, 4, 5], #mid row
        [6, 7, 8], #bot row 
        [0, 3, 6], #1st col
        [1, 4, 7], #2nd col
        [2, 5, 8], #3rd col
        [0, 4, 8], #left diag
        [2, 4, 6]  #right diag
     ]
    def current_player 
        if @board.turn_count.odd? == false
            player_1  
        else
            player_2
        end
    end

    def won?
         WIN_COMBINATIONS.detect do |array|
            array.all? {|index| @board.cells[index] == "X"} || array.all? {|index| @board.cells[index] == "O"}
            end
    end

    def draw?
        !won? && @board.full?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
             winner = won?
             @board.cells[winner[0]]
              
        else
            nil
        end
    end
    
    def turn 
      puts "Please enter 1-9:"
        input = current_player.move(input)
            
        if board.valid_move?(input)
          board.update(input, current_player)
          board.display
        else
          turn
        end
    end
    def play
        until over? 
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end

