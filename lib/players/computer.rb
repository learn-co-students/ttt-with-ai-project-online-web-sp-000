require 'pry'
module Players
  class Computer < Player
    def move(board_oi)
      move = nil
      if !(board_oi.taken?(5))
        move = "5"
      elsif board_oi.turn_count == 1
        move = [1, 3, 7, 9].sample.to_s
      elsif board_oi.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board_oi.taken?(i)}.to_s
      elsif board_oi.turn_count == 3
        Game::WIN_COMBINATIONS.each do |combo|
          if board_oi.position(combo[0]+ 1) == "X" && board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[2]+ 1) == " "
            move = "#{combo[2]+ 1}"
          elsif board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[2]+ 1) == "X" && board_oi.position(combo[0]+ 1) == " "
            move = "#{combo[0]+ 1}"
          elsif board_oi.position(combo[2]+ 1) == "X" && board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[0]+ 1) == " "
            move = "#{combo[0]+ 1}"
          end
        end
        if move == nil
          number = [1, 3, 7, 9].detect{|i| !board_oi.taken?(i)}
          move = "#{number}"
        end

      elsif board_oi.turn_count == 4 || board_oi.turn_count == 6 || board_oi.turn_count == 8
        Game::WIN_COMBINATIONS.each do |combo|
          if move == nil
            if board_oi.position(combo[0]+ 1) == "X" && board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[2]+ 1) == " "
              move = "#{combo[2]+ 1}"
            elsif board_oi.position(combo[0]+ 1) == "X" && board_oi.position(combo[2]+ 1) == "X" && board_oi.position(combo[1]+ 1) == " "
              move = "#{combo[1]+ 1}"
            elsif board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[2]+ 1) == "X" && board_oi.position(combo[0]+ 1) == " "
              move = "#{combo[0]+ 1}"
            end
          end
        end
        Game::WIN_COMBINATIONS.each do |combo|
          if move == nil
            if board_oi.position(combo[0]+ 1) == "O" && board_oi.position(combo[1]+ 1) == "O" && board_oi.position(combo[2]+ 1) == " "
              move = "#{combo[2]+ 1}"
            elsif board_oi.position(combo[0]+ 1) == "O" && board_oi.position(combo[2]+ 1) == "O" && board_oi.position(combo[1]+ 1) == " "
              move = "#{combo[1]+ 1}"
            elsif board_oi.position(combo[1]+ 1) == "O" && board_oi.position(combo[2]+ 1) == "O" && board_oi.position(combo[0]+ 1) == " "
              move = "#{combo[0]+ 1}"
            end
          end
        end
        if move == nil
          number = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{|i| !board_oi.taken?(i)}
          move = "#{number}"
        end
      elsif board_oi.turn_count == 5 || board_oi.turn_count == 7 || board_oi.turn_count == 9
        Game::WIN_COMBINATIONS.each do |combo|
          if move == nil
            if board_oi.position(combo[0]+ 1) == "O" && board_oi.position(combo[1]+ 1) == "O" && board_oi.position(combo[2]+ 1) == " "
              move = "#{combo[2]+ 1}"
            elsif board_oi.position(combo[0]+ 1) == "O" && board_oi.position(combo[2]+ 1) == "O" && board_oi.position(combo[1]+ 1) == " "
              move = "#{combo[1]+ 1}"
            elsif board_oi.position(combo[1]+ 1) == "O" && board_oi.position(combo[2]+ 1) == "O" && board_oi.position(combo[0]+ 1) == " "
              move = "#{combo[0]+ 1}"
            end
          end
        end
        Game::WIN_COMBINATIONS.each do |combo|
          if move == nil  
            if board_oi.position(combo[0]+ 1) == "X" && board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[2]+ 1) == " "
              move = "#{combo[2]+ 1}"
            elsif board_oi.position(combo[0]+ 1) == "X" && board_oi.position(combo[2]+ 1) == "X" && board_oi.position(combo[1]+ 1) == " "
              move = "#{combo[1]+ 1}"
            elsif board_oi.position(combo[1]+ 1) == "X" && board_oi.position(combo[2]+ 1) == "X" && board_oi.position(combo[0]+ 1) == " "
              move = "#{combo[0]+ 1}"
            end
          end
        end
        if move == nil
          number = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{|i| !board_oi.taken?(i)}
          move = "#{number}"
        end
      end
      move
    end
  end
end

