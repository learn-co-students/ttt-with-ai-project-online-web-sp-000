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
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
    def current_player
        board.turn_count.even? ? player_1 : player_2
    end
    def won?
      WIN_COMBINATIONS.each {|win_combo|
        index_0 = win_combo[0]
        index_1 = win_combo[1]
        index_2 = win_combo[2]
        local_cells = self.board.cells
        position_1 = local_cells[index_0]
        position_2 = local_cells[index_1]
        position_3 = local_cells[index_2]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        end
      }
      return false
    end

    def draw?
      if !won? && board.full?
        true
      else
        false
      end
    end

    def over?
      if won? || draw?
        true
      else
        false
      end
    end

    def winner
      index = []
        index = won?
        if index == false
          return nil
        else
          if board.cells[index[0]] == "X"
            "X"
          else
            "O"
          end
        end
    end

    def turn
        puts "Please choose a number 1-9:"
        if board.turn_count.even?
          user_input = @player_1.move(board)
          current_player = @player_1
        else
          user_input = @player_2.move(board)
          current_player = @player_2
        end
        if @board.valid_move?(user_input)
          @board.update(user_input, current_player)
          @board.display
        else
          turn
        end
    end

    def play
      until over? == true
        turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end


end
