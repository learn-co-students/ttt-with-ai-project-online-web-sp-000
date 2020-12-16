module Players
  class Computer < Player
    attr_accessor :first_move

    def initialize(token)
      super(token)
      @first_move = true
    end

    def move(board)
      puts "inside computer move"
      if(board.empty? || self.first_move)
        self.first_move = false
        return 4
      else
        if self.token == "X"
          move = play_strategy("X", "O", board)

        else
          move  = play_strategy("O", "X", board)
        end
      end
    end

    def play_strategy(token, opponent_token, board)
      winning_comb = Game::WIN_COMBINATIONS.find { |item|
        (board.cells[item[0]] == opponent_token && board.cells[item[1]] == opponent_token && board.cells[item[2]] == " ") || (board.cells[item[0]] == opponent_token &&  board.cells[item[2]] == opponent_token && board.cells[item[1]] == " ") ||
        (board.cells[item[1]] == opponent_token &&  board.cells[item[2]] == opponent_token && board.cells[item[0]] == " ")
        }
        if winning_comb == nil
          winning_comb = Game::WIN_COMBINATIONS.find { |item|
          (board.cells[item[0]] == token && board.cells[item[1]] == token && board.cells[item[2]] == " ") || (board.cells[item[0]] == token &&  board.cells[item[2]] == token  && board.cells[item[1]] == " ") ||
          (board.cells[item[1]] == token &&  board.cells[item[2]] == token && board.cells[item[0]] == " ")
          }
        end
        if winning_comb == nil
            puts "there are no two Xs or Os in one row, looking for single"
            winning_comb = Game::WIN_COMBINATIONS.find { |item| (!board.taken?(item[0]) || !board.taken?(item[1]) || !board.taken?(item[2])) &&
          (board.cells[item[0]] == opponent_token || board.cells[item[1]] == opponent_token || board.cells[item[2]] == opponent_token)}
        end
        puts winning_comb.to_s + "winning combination"
        if !board.taken?(winning_comb[0])
          move = winning_comb[0]
          puts "move "+move.to_s
          move
        elsif !board.taken?(winning_comb[2])
          move = winning_comb[2]
          puts "move "+move.to_s
          move
        else
          move = winning_comb[1]
          puts "move "+move.to_s
          move
        end
    end

  end
end
