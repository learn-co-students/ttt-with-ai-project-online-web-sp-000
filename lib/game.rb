class Game

    attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [2,5,8],
    [0,3,6]
  ]
    def greeting 
        puts "Hi, welcome to Tic Tac Toe!"
        puts "What kind of game would you like to play? With 0, 1, or 2 player?"
        
        players = gets.strip
      
        case players 

        when "0"
            @player_1 = Players::Computer.new("X")
            @player_2 = Players::Computer.new("O")
            self.play
        when "1" 
        #   binding.pry
            @player_2 = Players::Computer.new("O")
            self.play
        when "2" 
            self.play
            # @player_1 = Players::Human.new("X")
            # @player_2 = Players::Human.new("O")
        else 
           "Please choose 0, 1, or 2"
        end
    end
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board 
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
       @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win|
      
            win_1 = win[0]
            win_2 = win[1]
            win_3 = win[2]
  
            first_position = @board.cells[win_1]
            second_position = @board.cells[win_2]
            third_position = @board.cells[win_3]
     
        if first_position == "X" && second_position == "X" && third_position == "X" || first_position == "O" && second_position == "O" && third_position == "O"
                return win
            end          
         end
        false
    end

    def draw?
         @board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if won?
            winner_arr = won?
           @board.cells[winner_arr[0]]
        else
            nil
        end
    end

    def turn
        player = current_player
        input = player.move(board)
        # binding.pry
        if @board.valid_move?(input)
            @board.update(input, player)
        else
            puts "That position is taken, please try again."
            self.turn
        end
    end

    def play
        #against computer? if yes, then player2 = computer
        while !over?
            @board.display
            turn 
        end
        if won?
            
            puts "Congratulations #{winner}!"
            @board.display
        elsif draw?
            puts "Cat's Game!"
            @board.display
        end
        puts "Would you like to play another game? y or n"
        play_again?

    end

    def play_again? 
      input = gets.strip

        if input == "y"
            greeting
        elsif input == "n"
            puts "Ok, have a good day!"
            abort
        else
            puts "Please choose y or n"
            play_again?
        end
    end

end