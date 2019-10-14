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

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if @board.turn_count.odd?
        @player_2
      else
        @player_1
      end
    end

    def turn
      this_player = current_player
      this_move = this_player.move(@board)
      if @board.valid_move?(this_move)
        @board.update(this_move, this_player)
      else
        "Please try again."
        this_player.move(@board)
      end
    end

    def play
      while !over?
        puts "Please enter your input."
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
      end
    end

    def draw?
      @board.full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      if winning_combo = won?
        @winner = @board.cells[winning_combo[0]]
      end
    end
end
