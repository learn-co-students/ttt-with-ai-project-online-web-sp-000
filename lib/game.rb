class Game

    WIN_COMBINATIONS = [
        [0, 1, 2], #top row win
        [3, 4, 5], #middle row win
        [6, 7, 8], #bottom row win
        [0, 4, 8], #diagonal win
        [2, 4, 6], #diagonal win
        [0, 3, 6], #left column win
        [1, 4, 7], #middle column win
        [2, 5, 8]  #right column win
      ]


    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        self.board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
          @board.cells[combo[0]] == @board.cells[combo[1]] &&
          @board.cells[combo[1]] == @board.cells[combo[2]] &&
          @board.taken?(combo[0] + 1)
        end
      end

    def draw?
        self.board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            self.board.cells[won?[0]]
        end
    end

    def turn
        puts board.display
        move = current_player.move(board)
        if !board.valid_move?(move)
            turn
        else
            self.board.update(move, current_player)
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts board.display
            puts "Congratulations #{winner}!"
        end
        if draw?
            puts board.display
            puts "Cat's Game!"
        end
    end

end