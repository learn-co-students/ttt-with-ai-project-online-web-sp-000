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
        number = [1, 3, 7, 9].detect{|i| !board_oi.taken?(i)}
        move = "#{number}"
        
      elsif board_oi.turn_count == 3
      [[0, 1, 2], [1, 4, 7], [2, 5, 8], [0, 3, 6], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
        Game::WIN_COMBINATIONS.each do |combo|
          array = []
          combo.each {|i| array << board_oi.position(i)}
          if array.count("X") == 2 && array.count(" ") == 1
            number = combo.detect {|i| !board_oi.taken?(i)}
            move = "#{number}"
          end
        end
        if move == nil
          number = [1, 3, 7, 9].detect{|i| !board_oi.taken?(i)}
          move = "#{number}"
        end
      elsif board_oi.turn_count == 4 || board_oi.turn_count == 6 || board_oi.turn_count == 8
        Game::WIN_COMBINATIONS.each do |combo|
          if board_oi.position(combo[0]) == "X" && board_oi.position(combo[1]) == "X" && board_oi.position(combo[2]) == " "
            move = "#{combo[2]}"
          elsif board_oi.position(combo[0]) == "X" && board_oi.position(combo[2]) == "X" && board_oi.position(combo[1]) == " "
            move = "#{combo[1]}"
          elsif board_oi.position(combo[1]) == "X" && board_oi.position(combo[2]) == "X" && board_oi.position(combo[0]) == " "
            move = "#{combo[0]}"
          end
          if board_oi.position(combo[0]) == "O" && board_oi.position(combo[1]) == "O" && board_oi.position(combo[2]) == " "
            move = "#{combo[2]}"
          elsif board_oi.position(combo[0]) == "O" && board_oi.position(combo[2]) == "O" && board_oi.position(combo[1]) == " "
            move = "#{combo[1]}"
          elsif board_oi.position(combo[1]) == "O" && board_oi.position(combo[2]) == "O" && board_oi.position(combo[0]) == " "
            move = "#{combo[0]}"
          end
          if move == nil
            number = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{|i| !board_oi.taken?(i)}
            move = "#{number}"
          end
        end
      end
      move
    end
  end
end

#[2, 4, 6, 8, 5]