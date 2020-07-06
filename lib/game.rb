class Game
    attr_accessor :board, :player_1, :player_2, :user_input

    def initialize(player_1=nil, player_2=nil, board=nil)
        @board = board || Board.new
        @player_1 = player_1 || Players::Human.new("X")
        @player_2 = player_2 || Players::Human.new("O")
        if @player_1.token != "X"
            @player_1, @player_2 = @player_2, @player_1
        end
        #@board.display
    end

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

    def current_player
        @board.turn_count.odd? ? player_2 : player_1    
    end

    def won?
        #binding.pry
        WIN_COMBINATIONS.each do |combo|
            if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1) # taken? is expecting to receive an input, while we are using index for this method
            return combo
            end
        end
            false
    end

    def draw? # When the board is full? and neither player_1 or player_2 won?, then there is a draw
        @board.full? && !won? ? true : false
    end
    

    def over?
        (won? || draw?) ? true : false
    end

    def winner # If one player wins return their token, and if their isn't a winner return nil
        #binding.pry
        win_combo = won?
        if win_combo
          return @board.cells[win_combo[0]]
        end
    end

    def turn
        puts "Please enter a number 1-9:"
        @user_input = current_player.move(@board)
        if @board.valid_move?(@user_input)
          @board.update(@user_input, current_player)
        else puts "Please enter a number 1-9:"
          @board.display
          turn
        end
        @board.display
    end

    def play 
      turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

    def start
       puts "How many players? (0, 1 or 2)"
       input = gets.strip
       case input
      when "0"
        Game.new(Player::Computer.new("X"), Player::Computer.new("O")).play
        puts "That was fun! Would you like to play again?"
        loop_around
      when "1"
        Game.new(Player::Human.new("X"), Player::Computer.new("O")).play
        puts "That was fun! Would you like to play again?"
        loop_around
      when "2"
        Game.new(Player::Human.new("X"), Player::Human.new("O")).play
        puts "That was fun! Would you like to play again?"
        loop_around
      else
        puts "That is an invalid entry"
        start
      end
    end

  def loop_around
    puts "Please input y or n"
    answer = gets.strip
    case answer
      when "y"
        start
      when "n"
        puts "Goodbye!"
      else
        loop_around
      end
    end
end
