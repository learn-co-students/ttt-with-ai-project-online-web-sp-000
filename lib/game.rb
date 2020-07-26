require 'pry'

class Game
    attr_accessor :player_1, :player_2, :board
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end
    

    def current_player
       @board.turn_count % 2 == 0 ? @player_1 : @player_2 
    end

    def won?
        numSpaces = 0
        counter = 0
  
        while counter < 9
            if @board.taken?(counter) == false
                numSpaces += 1
            end
        counter +=1
        end

        if numSpaces < 9
        WIN_COMBINATIONS.each do |listArray|

        index_one = listArray[0]
        index_two = listArray[1]
        index_three = listArray[2]

        position_one = @board.cells[index_one]
        position_two = @board.cells[index_two]
        position_three = @board.cells[index_three]

        if position_one == "X" && position_two == "X" && position_three == "X"
            return [listArray[0], listArray[1], listArray[2]]
        elsif position_one == "O" && position_two == "O" && position_three == "O"
            return [listArray[0], listArray[1], listArray[2]]
        end

        end
            if numSpaces == 0
            return false
            end
        else
            false
        end
    end

    def draw?
        if !won? && @board.full?  
            return true
          else
            return false
          end
    end

    def over?
        won? || draw? || @board.full?
    end

    def winner
        if won?
            @board.cells[won?.first]
        end
    end

    def turn
      puts "Please enter 1-9"
      @board.display
        player = current_player
        current_move = player.move(@board)
        if @board.valid_move?(current_move)
            @board.update(current_move,player)
            player = current_player
        else
          puts "Please enter a valid move"
          turn
        end
    end

    def play  
    turn until over?
        if won?
          @board.display
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end