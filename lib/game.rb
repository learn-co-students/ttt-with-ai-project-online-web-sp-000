
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
    [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if board.turn_count.even?
        player_1
      else
        player_2
      end
    end

      def won?
        #game is won if any winning combinations\
        WIN_COMBINATIONS.each do |winner| #comes out with [0,1,2]
        win_index_1 = winner[0]
         win_index_2 = winner[1]
         win_index_3 = winner[2]

         position_1 = @board.cells[win_index_1] #store board position 0
         position_2 = @board.cells[win_index_2] #store board position 1
         position_3 = @board.cells[win_index_3] #store board position 2

           if position_1 == "X" && position_2 == "X" && position_3 == "X"
             return winner
           elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
             return winner
           end
         end
         false
      end

      def draw?
        !won? && @board.full?
      end

      def over?
        @board.full? || draw? || won?
      end

      def winner
          if won? != false
            win_combo = won?
            win_char = win_combo[0]
            position_win = @board.cells[win_char]
            position_win
          else
             nil
           end
      end

      def turn
        #makes the move
        player = current_player #figure out who is up
        current_move = player.move(@board) #ask for the move
        #check if a valid move?
        if !@board.valid_move?(current_move)
          turn
        else
          @board.display
          @board.update(current_move, player)
          puts "#{player.token} moved #{current_move}"
          @board.display
        end
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
