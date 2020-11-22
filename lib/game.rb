class Game
    attr_accessor :board, :player_1, :player_2

    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def won
    end

    def winner
    end

    def start
    end

    def play
    end

    def turn
    end

end