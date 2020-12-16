module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect do |index|
          !board.taken?(index)
        end.to_s
      elsif board.turn_count == 3 &&
            (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"
      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select do |index|
            board.position(index + 1) == token
          end.size == 2 && combo.any? do |index|
            board.position(index + 1) == " "
          end
            move = combo.select do |index|
              !board.taken?(index + 1)
            end.first.to_i.+(1).to_s
          elsif combo.select do |index|
            board.position(index + 1) != " " && board.position(index + 1) != token
          end.size == 2 && combo.any? do |index|
            board.position(index + 1) == " "
          end
            move = combo.select do |index|
              !board.taken?(index + 1)
            end.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect do |index|
          !board.taken?(index)
        end.to_s if move == nil
      end

      move
    end
  end
end
