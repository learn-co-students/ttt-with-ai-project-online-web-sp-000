require 'pry'

module Players
  class Computer < Player

    def move(board)
      available_positions = collect_positions_by_token(board, " ").compact
      positions_taken_by_self = collect_positions_by_token(board, self.token).compact
      if self.token == "X"
        other_token = "O"
      else
        other_token = "X"
      end
      positions_taken_by_other = collect_positions_by_token(board, other_token).compact

      position = best_position(available_positions, positions_taken_by_self, positions_taken_by_other)
      puts "Computer is making a move..."
      board.update(position, self)
      position
    end

    private

    def collect_positions_by_token(board, token_to_compare)
      position = 0
      board.cells.collect do |token|
        position += 1
        if token == token_to_compare
          position
        end
      end
    end

    def best_position(available_positions, positions_taken_by_self, positions_taken_by_other)
      total_win_combinations = Game::WIN_COMBINATIONS

      # first goal is to win if we can win with the next move
      position = position_to_win(total_win_combinations,
        available_positions, positions_taken_by_self)
      if position != 0
        return position
      end

      # first goal is to salvage game and make sure other player doesn't win.
      position = position_to_save_game(total_win_combinations,
        available_positions, positions_taken_by_other)

      if position != 0
        # best position is the position that saves game!!
        return position
      end

      # no need to save game, lets try to win!
      best_win_combination =
        best_available_win_combination(total_win_combinations, available_positions,
        positions_taken_by_self)

      best_win_combination.each do |index|
        if !positions_taken_by_self.include?(index+1)
          position = (index+1).to_s
        end
      end
      position
    end

    def position_to_win(total_win_combinations, available_positions, positions_taken_by_self)
      position = 0
      best_win_combination =
        best_available_win_combination(total_win_combinations, available_positions,
        positions_taken_by_self)

      position_taken_count = 0
      best_win_combination.each do |index|
        if positions_taken_by_self.include?(index+1)
          position_taken_count += 1
        end
        if !positions_taken_by_self.include?(index+1)
          position = (index+1).to_s
        end
      end

      if position_taken_count != 2
        position = 0
      end

      position
    #end of function
    end

    def position_to_save_game(total_win_combinations, available_positions, positions_taken_by_other)
      position = 0
      best_win_combination =
        best_available_win_combination(total_win_combinations, available_positions,
        positions_taken_by_other)

      position_taken_count = 0
      best_win_combination.each do |index|
        if positions_taken_by_other.include?(index+1)
          position_taken_count += 1
        end
        if !positions_taken_by_other.include?(index+1)
          position = (index+1).to_s
        end
      end

      if position_taken_count != 2
        position = 0
      end

      position
    #end of function
    end

    def best_available_win_combination(total_win_combinations, available_positions, taken_positions)
      possible_win_combinations =
      total_win_combinations.collect do |combination|
        # WIN_COMBINATIONS is based on index not position, so add 1.
        if (available_positions.include?(combination[0]+1) || taken_positions.include?(combination[0]+1)) &&
           (available_positions.include?(combination[1]+1) || taken_positions.include?(combination[1]+1)) &&
           (available_positions.include?(combination[2]+1) || taken_positions.include?(combination[2]+1))
          combination
        end
      end
      possible_win_combinations = possible_win_combinations.compact
      best_win_combination = []
      best_position_taken_count = 0

      possible_win_combinations.each do |combination|
        positions_taken = 0
        if taken_positions.include?(combination[0]+1)
          positions_taken += 1
        end
        if taken_positions.include?(combination[1]+1)
          positions_taken += 1
        end
        if taken_positions.include?(combination[2]+1)
          positions_taken += 1
        end

        if positions_taken > best_position_taken_count
          best_position_taken_count = positions_taken
          best_win_combination = combination
        end

        if best_win_combination.empty?
          best_win_combination = combination
        end

        if positions_taken == 2
          # close to securing a game, already have occupied 2 positions.
          break
        end
      end
      best_win_combination
    end

  # end of class
  end
#end of module
end
