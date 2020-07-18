class Game

    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]

    def board
        @board
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
        WIN_COMBINATIONS.detect do |win_combination|
            (@board.cells[win_combination[0]]=="X" && @board.cells[win_combination[1]]=="X" && @board.cells[win_combination[2]]=="X") ||
            (@board.cells[win_combination[0]]=="O" && @board.cells[win_combination[1]]=="O" && @board.cells[win_combination[2]]=="O")
        end 
    end

    def full?
        @board.cells.none?{|position| position == " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || won?
    end

    def winner
        if won?
            return @board.cells[won?[0]]
        end
        return nil
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def turn
        input = current_player.move(@board).to_i
        if @board.valid_move?(input)
            @board.update(input,current_player)
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
        else
          puts "Cat's Game!"
        end
    end




end