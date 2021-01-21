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
            position_1 == position_2 && position_2 == position_3 && self.board.taken?(windex_1)
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
            #&& self.board.cells[self.won?[0]] == "X" || self.board.cells[self.won?[0]] == "O"
        self.board.cells[self.won?[0]]
        end

        # if self.won?
        #     winning_combo = self.won?
        #     return self.board.cells[winning_combo[0]]
        # end
    end

end