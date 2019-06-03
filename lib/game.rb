class Game
    attr_accessor :player_1, :player_2, :board

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    
    end 

    def current_player
        #
        @board.turn_count % 2 == 0 ? player_1 : player_2
    end 

     def won?
         WIN_COMBINATIONS.detect{|winner|
        @board.cells[winner[0]] == @board.cells[winner[1]] && @board.cells[winner[1]] == @board.cells[winner[2]] && (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")}
     end
     
     def draw?
        @board.full? && !won?
     end 

     def over?
        won? || draw?
     end 

     def winner 
        if winning_combo = won?
            @winner = @board.cells[winning_combo.first]
        end 
       
     end 

     def turn 
        
            # find the current player
            player = current_player
            # call 'move' on the current player, passing in the board as an argument
            person = player.move(board)
            # find out if the move is valid.
            if board.valid_move?(person)
                 # print the turn number, print the current board, update the board, print the player token and move
               puts board.turn_count 
               puts board
               board.update(person, player)
               puts person
               puts player.token


               # If it isn't, call the 'turn' method recursively
        
            else
                turn
           
             end 
        # puts "Where would you like to go"
        # if valid_move?(current_player.move(board))
    end 
    def play 
        while !over?
            turn
        end 
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end 
    
     # asks for players input on a turn of the game
       
       #  'checks if the game is over after every turn
       # plays the first turn of the game
       #'plays the first few turns of the game'
          

       # 'checks if the game is won after every turn
       
       # checks if the game is a draw after every turn
      
       # stops playing if someone has won
       # 'congratulates the winner X'
       #  'congratulates the winner O      
       # 'stops playing in a draw' 
       # 'prints "Cat\'s Game!" on a draw
       # 'plays through an entire game'
       
       

                         
        
  
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2]
    ]
end 
