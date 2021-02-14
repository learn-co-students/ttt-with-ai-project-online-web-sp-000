module Players
  class Computer < Player

    def competitor_token
      @token == "X" ? "O" : "X"
    end

    def map_tokens(board, combination) #maps the positions on the board to the tokens that occupy them
      combination.map { |position| board.cells[position] }
    end

    def move(board)
      competitor_strategy = Game::WIN_COMBINATIONS.detect{ |win_combination|
        combination_tokens = self.map_tokens(board, win_combination)
        combination_tokens.count(self.competitor_token) > 1 && combination_tokens.count(" ") > 0
      }
      if competitor_strategy != nil
        chosen_postion = competitor_strategy.find { |position| board.cells[position] == " " }
        chosen_turn = (chosen_postion + 1).to_s
        return chosen_turn
      else
        random_position = rand(0..8)
        random_chosen_turn = (random_position + 1).to_s
        return random_chosen_turn
      end
    end

  end
end
