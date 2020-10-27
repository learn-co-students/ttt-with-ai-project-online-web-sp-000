class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                        [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        turns = @board.cells.select {|i| i == "X" || i == "O"}
        turns.count % 2 == 0 ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.find do |win_arrays|
            pos1 = win_arrays[0]
            pos2 = win_arrays[1]
            pos3 = win_arrays[2]
            if @board.cells[pos1] == "X" && @board.cells[pos2] == "X" && @board.cells[pos3] == "X" || @board.cells[pos1] == "O" && @board.cells[pos2] == "O" && @board.cells[pos3] == "O"
             return win_arrays
            end
        end
        false
    end

    def draw?
      !board.cells.detect {|i| i == " "} && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      if won?
        winner = won?[0]
        @board.cells[winner]
      end
    end

    def turn
      puts "Please enter 1-9:"
      player = self.current_player
      input = player.move
      if @board.valid_move?(input) && !@board.taken?(input)
        @board.update(input, player)
        @board.display
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
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
