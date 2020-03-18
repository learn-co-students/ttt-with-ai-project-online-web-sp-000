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
        timer <= 0 ? @timer = 0.01 : @timer = timer
        move = []
        board.cells.each.with_index(1) do |d, i|
          if d == " "
            move << "#{i}"
          end
        end
        case
          when win != nil
            input = win + 1
          when block != nil
            input = block + 1
          when center?
            input = "5"
          when opposing_corner != nil && board.taken?(opposing_corner) == false
            input = opposing_corner
          else
            input = move[rand(move.length)]
        end
      end

      def win
        win_row = WIN_COMBINATIONS.find do |win_comb|
          board.cells[win_comb[0]] == token && (board.cells[win_comb[1]] == token || board.cells[win_comb[2]] == token) || (board.cells[win_comb[1]] == token && board.cells[win_comb[2]] == token)
          end
          if win_row != nil
            win_move = win_row.find {|x| board.cells[x] == " "}
        end
      end
      def corners
        corners = [1, 3, 7, 9]
        corners.find {|c| board.cells[c] == " "}
      end
      def center?
        board.cells[4] == " "
      end
      def block
        win_row = WIN_COMBINATIONS.find do |win_comb|
          board.cells[win_comb[0]]== not_i && (board.cells[win_comb[1]] == not_i || board.cells[win_comb[2]] == not_i) || (board.cells[win_comb[1]] == not_i && board.cells[win_comb[2]] == not_i)
          end
          if win_row != nil
            win_move = win_row.find {|x| board.cells[x] == " "}
          end
        end
        def not_i
          token == "X" ? "O" : "X"
        end
        def opposing_corner
          case
          when board.taken?(1) && !board.taken?(9)
            9
          when board.taken?(9) && !board.taken?(1)
            1
          when board.taken?(3) && !board.taken?(7)
            7
          when board.taken?(7) && !board.taken?(3)
            3
          else
            nil
          end
        end
  end
end
