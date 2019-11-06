class Game
  attr_accessor :board, :player_1, :player_2
      WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.each do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]

      element_1 = @cells[index_1]
      element_2 = @cells[index_2]
      element_3 = @cells[index_3]

      if element_1 == "X" && element_2 == "X" && element_3 == "X" || element_1 == "O" && element_2 == "O" && element_3 == "O"
        return win_combo
      end
    end
      @cells.any? == "X" || @cells.any? == "O"
    end


    def winner
      if winning_combo = won?
      @winner = @board.cells[winning_combo.first]

      end
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw? || full?
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


    def start
    end

    def play
    end

    def turn
    end

end
