class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        current_turn = self.board.cells.filter{|cell| cell.include?('X') || cell.include?('O')}.length + 1

        if current_turn.odd?
            return player_1
        else
            return player_2
        end
    end

    def won?
        match_win = WIN_COMBINATIONS.map do |win_combo|
            win_combo.map {|index| self.board.cells[index]}.all?('X') ||             win_combo.map {|index| self.board.cells[index]}.all?('O')
        end

        if match_win.include?(true)
            index = match_win.find_index(true)
            WIN_COMBINATIONS[index]
        end
    end

    def draw?
        if !self.board.cells.include?(" ") && !self.won?
            return true
        end
    end

    def over?
        if self.draw? || self.won?
            return true
        end
    end

    def winner
        if self.won?
            self.board.cells[self.won?[0]]
        end
    end
    
    def turn
        cell = current_player.move(board)

        if self.board.valid_move?(cell)
            self.board.cells[cell.to_i - 1] = current_player.token
        else
            puts "Invalid move."
            turn
        end                
    end

    def play
        until over?
            puts "Where would you like to go? 1-9"
            turn
        end

        if over? && won?
            puts "Congratulations #{winner}!"
        elsif over? && draw?
            puts "Cat's Game!"
        end

    end

end