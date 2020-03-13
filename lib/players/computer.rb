require "pry"

module Players
  class Computer < Player
    def move(board)
    	puts "the computer (#{self.token}) went like this:"
        # input = (rand * 10).round.to_s
        danger_combo = Game::WIN_COMBINATIONS.detect do |combo|
          (board.cells[combo[0]] == board.cells[combo[1]] ||
          board.cells[combo[1]] == board.cells[combo[2]] ||
          board.cells[combo[2]] == board.cells[combo[0]]) &&
          (combo.collect { |index| index if board.cells[index] == " " }.compact.count == 1) &&
          !combo.collect { |index| board.cells[index]}.include?(self.token)
          # (combo.collect { |index| index if board.cells[index] != self.token }.compact.count == 2)
        end

        if danger_combo != nil
          # puts "danger combo: #{danger_combo}"
          cutoff_ind = danger_combo.detect do |index|
            board.cells[index] == " "
          end
          input = (cutoff_ind + 1).to_s
        else
          input = (rand * 10).round.to_s
        end
        # binding.pry
    end
  end
end

          # (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ")