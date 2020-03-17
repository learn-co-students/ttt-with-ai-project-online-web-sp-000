class Players < Player
  class Computer < Players
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]]

      def move (board, timer = 0)
        # binding.pry
        timer <= 0 ? @timer = 0.01 : @timer = timer
        move = []
        board.cells.each.with_index(1) do |d, i|
          if d == " "
            move << "#{i}"
          end
        end
        case
          #binding.pry
          when win != nil
            win
          when win == nil
            move[rand(move.length)]
        end
      end

      def win
        win_row = WIN_COMBINATIONS.each do |win_comb|
          win_comb[0] == self.token && (win_comb[1] == self.token || win_comb[2] == self.token) || (win_comb[1] == self.token && win_comb[2] == self.token)
          end
          if win_row != nil
            win_move = win_row.find {|x| x == " "}
        end
      end
  end
end
