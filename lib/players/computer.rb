module Players
  class Computer < Player
    def move(board_oi)
      move = nil
      if !(board_oi.taken?(5))
        move = "5"
      elsif board_oi.turn_count == 1
        number = [1, 3, 7, 9].sample
        move = "#{number}"
      elsif board_oi.turn_count == 2
        if board_oi.position(1) == "O" || board_oi.position(9) == "O"
          number = [2, 3, 6, 4, 7, 8].detect {|i| !board_oi.taken?(i)}
          move = "#{number}"
        elsif board_oi.position(3) == "O" || board_oi.position(7) == "O"
          number = [2, 1, 6, 4, 9, 8].detect {|i| !board_oi.taken?(i)}
          move = "#{number}"
        else
          number = [1, 3, 7, 9].sample
          move = "#{number}"
        end
        
      elsif board_oi.turn_count == 3
        Game::WIN_COMBINATIONS.each do |combo|
          if board_oi.position(combo[0]) == board_oi.position(combo[1]) && board_oi.position(combo[0]) == "X"
            move = "#{combo[2]}"
          elsif board_oi.position(combo[0]) == board_oi.position(combo[2]) && board_oi.position(combo[0]) == "X"
            move = "#{combo[1]}"
          elsif board_oi.position(combo[2]) == board_oi.position(combo[1]) && board_oi.position(combo[2]) == "X"
            move = "#{combo[0]}"
          end
        end
        if move = nil
          number = [1, 3, 7, 9].sample
          move = "#{number}"
        end
      else                           
        number = board_oi.move_box.sample
        move = "#{number}"
        board_oi.update_move_box(number)
      end
      move
    end
  end
end

#[2, 4, 6, 8, 5]