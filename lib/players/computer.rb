module Players

  class Computer < Player
    def move(board)
      if board.turn_count == 0
        choice = "5"
        sleep 0.5
        choice

      elsif board.turn_count == 1 && board.taken?(5) == false
        choice = "5"
        sleep 0.5
        choice

      elsif board.turn_count == 1 && board.taken?(5)
        choice = "3"
        sleep 0.5
        choice

      elsif board.turn_count == 2
        choice = (1..9).to_a.sample
        sleep 0.5
        choice

      elsif board.turn_count == 3
        choice = (1..9).to_a.sample
        sleep 0.5
        choice

      elsif board.turn_count == 4
        choice = (1..9).to_a.sample
        sleep 0.5
        choice

      elsif board.turn_count == 5
        choice = (1..9).to_a.sample
        sleep 0.5
        choice

      elsif board.turn_count == 6
        choice = (1..9).to_a.sample
        sleep 0.5
        choice

      elsif board.turn_count == 7
        choice = (1..9).to_a.sample
        sleep 0.5
        choice

      elsif board.turn_count == 8
        choice = (1..9).to_a.sample
        choice

      elsif board.turn_count == 9
        choice = (1..9).to_a.sample
        choice
      end

      # Worked in a sandbox environment, but couldn't get this to play nicely with the valid_move method for some reason...

      # def stop_enemy
      #   choice = nil
      #   if board.turn_count.odd?
      #     WIN_COMBINATIONS.each do |combo|
      #       if board.position(combo[0] + 1) == "X" && board.position(combo[1] + 1) == "X" && board.taken?(combo[2] + 1) == false
      #         choice = "#{combo[2] + 1}"
      #      elsif board.position(combo[1] + 1) == "X" && board.position(combo[2] + 1) == "X" && board.taken?(combo[0] + 1) == false
      #         choice = "#{combo[0] + 1}"
      #      elsif board.position(combo[0] + 1) == "X" && board.position(combo[2] + 1) == "X" && board.taken?(combo[1] + 1) == false
      #         choice = "#{combo[1] + 1}"
      #       end
      #     end
      #   elsif board.turn_count.even?
      #     WIN_COMBINATIONS.each do |combo|
      #       if board.position(combo[0] + 1) == "O" && board.position(combo[1] + 1) == "O" && board.taken?(combo[2] + 1) == false
      #         choice = "#{combo[2] + 1}"
      #      elsif board.position(combo[1] + 1) == "O" && board.position(combo[2] + 1) == "O" && board.taken?(combo[0] + 1) == false
      #         choice = "#{combo[0] + 1}"
      #      elsif board.position(combo[0] + 1) == "O" && board.position(combo[2] + 1) == "O" && board.taken?(combo[1] + 1) == false
      #         choice = "#{combo[1] + 1}"
      #       end
      #     end
      #   end
      #   return choice
      # end         #End stop_enemy

    end     #End def move
  end     #End Class
end   #End Module
