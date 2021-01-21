class Game
    attr_accessor :board, :player, :player_1, :player_2
    #attr_reader :board

    WIN_COMBINATIONS = 
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6]

    def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
        @player_1 = p1
        @player_2 = p2
        @board = board
    end

    def current_player
      num = self.board.turn_count
      if num.odd?
        player_2
      else
        player_1
      end
    end

    def won?
        
        WIN_COMBINATIONS.find do |combo|
            windex_1 = combo[0]
            windex_2 = combo[1]
            windex_3 = combo[2]

            position_1 = self.board.cells[windex_1]
            position_2 = self.board.cells[windex_2]
            position_3 = self.board.cells[windex_3]
            position_1 == position_2 && position_2 == position_3 && self.board.taken?(windex_1 + 1)
        end
    end

    def draw?
        self.board.full? && !self.won?
    end

    def over?
        self.won? || self.draw?
    end

    def winner 
        if self.won? 
        self.board.cells[self.won?[0]]
        end
    end

    def turn
        puts "Please enter 1-9"
        input = current_player.move(self.board)
        if self.board.valid_move?(input)
            self.board.update(input, current_player)
        else
            puts "No can move buddy rove"
            self.turn
        end    
    end

    def play
        until self.over? do
            if current_player.token == "X"
                puts "Strike now Daniel Son!"
            elsif current_player.token == "O"
                puts "Hit hard and fast Johnny Lawrence!"
            end
        self.turn
        self.board.display
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

    # def start
    #     puts "Welcome to tic tac toe!"
    #     puts "Enter amount of players:"
       
    # end

    # def two_player_match
    #     puts "Player One, who do you fight for?"
    #     p1 = gets.chomp
    #     until p1 == "X" || p1 == "O"
    #         puts "That house has been destroyed"
    #         p1 = gets.strip
    #     end
    #     if p1 = "X"
    #         p2 = "O"
    #     else
    #         p2 = "X"
    #     end
    #     puts "Player two, you fight for #{p2}."
        
    #     game = Game.new(Players::Human.new(p1), Players::Human.new(p2))
    # end
end