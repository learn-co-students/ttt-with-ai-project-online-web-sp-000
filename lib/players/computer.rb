class Players < Player
  class Computer < Players
    attr_accessor :board

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
        @board = board
        # binding.pry
        timer <= 0 ? @timer = 0.01 : @timer = timer
        move = []
        board.cells.each.with_index(1) do |d, i|
          if d == " "
            move << "#{i}"
          end
        end
        case
          when win != nil
            binding.pry
            win + 1
          when block != nil
            binding.pry
            block + 1
          when center?
            binding.pry
            input = 5
          when corners != nil
            binding.pry
            corner[rand(corners.length) + 1]
          # when win == nil
          #
          #   move[rand(move.length)]
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
      def corners
        corners = ["1", "3", "7", "9"]
        corner = corners.find{|c| c ==" "}
      end
      def center?
        board.cells[4] == " "
      end
      def block
        win_row = WIN_COMBINATIONS.each do |win_comb|
          win_comb[0] == not_i && (win_comb[1] == not_i || win_comb[2] == not_i) || (win_comb[1] == not_i && win_comb[2] == not_i)
          end
          if win_row != nil
            win_move = win_row.find {|x| x == " "}
          end
        end
        def not_i
          token == "X" ? "O" : "X"
        end

  end
end
