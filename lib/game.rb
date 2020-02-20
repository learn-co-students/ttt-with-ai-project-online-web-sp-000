class Game 
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    end 

    def current_player
    @board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combination|
       win_combination.all? { |win_index| board.cells[win_index] == "X" } ||
       win_combination.all? { |win_index| board.cells[win_index] == "O" }
     end
     end
    
     def full?
        board.cells.each {|a| return false if a == " "}
    end

    def draw?
        if !won? && full?
       return true 
      end
    end

    def over?
        if won? || full? || draw?
            return true
        else
            false
        end
    end

    def winner
        win = won?
          if win
            return board.cells[win[0]]
        end
      end

      def turn
        @board.display
        puts "Please enter 1-9:"
        input = current_player.move(@board)
        if @board.valid_move?(input)
          board.update(input, current_player)
        else
          turn
        end
      end

    def play
    turn until over?
        if won?
        puts board.display
        puts "Congratulations #{winner}!"
        elsif draw?
        puts board.display
        puts "Cat's Game!"
        end
    end
end 