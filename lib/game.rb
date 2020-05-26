class Game
    @@all = []
    attr_accessor :player_1, :player_2, :board

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
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board 
        @player_1 = player_1
        @player_2 = player_2
        @@all << self 
    end 
    
    def self.all 
        @@all 
    end 
    
    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end 

    def won?
        WIN_COMBINATIONS.find{|winner_array| @board.cells[winner_array[0]] == @board.cells[winner_array[1]] && @board.cells[winner_array[1]] == @board.cells[winner_array[2]] && @board.taken?(winner_array[0]+1)}
    end 
    
    def draw?
        !won? && board.full?
    end 
    
    def over?
        won? || draw?
    end 
    
    def winner
        if won? 
            @board.cells[won?.first] 
        end 
    end 
    
    def turn 
        player = current_player.move(board)
        if board.valid_move?(player)
            puts "The move was valid!"
            board.update(player, current_player)
        elsif !board.valid_move?(player)
            puts "The move was NOT valid!"
            turn 
        end 
    end

    def play 
        while !over?
            turn
            board.display
        end 
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end 
    end 

end