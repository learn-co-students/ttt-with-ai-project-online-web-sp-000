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
        [2,4,6]
    ]

    def initialize(player_1=Players::Human.new('X'), player_2=Players::Human.new('O'), board=Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        @board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win|
            row = [ @board.cells[win[0]], @board.cells[win[1]], @board.cells[win[2]] ]
            if [['X','X','X'],['O','O','O']].include?(row)
                return win
            end
        end
        nil
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            return @board.cells[won?[0]]
        end
    end

    def turn
        #puts "Player #{current_player}, enter a position from 1-9: "
        #binding.pry
        input = current_player.move(@board)
        if @board.valid_move?(input)
            @board.update(input, current_player)
            @board.display
        else
            turn
        end
    end

    def play
        until over?
            turn
        end

        puts "Congratulations #{winner}!" if won?
        puts "Cat's Game!" if draw?
    end
 
end