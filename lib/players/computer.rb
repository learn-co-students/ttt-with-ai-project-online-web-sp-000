module Players
  class Computer < Player
    def move(board)
      puts "What would you like your move to be? (1-9)"
      #   (1..9).to_a.sample.to_s
      #is this class connected to the Board class and if so how?
      if !board.taken?("5")
        user_input = "5" #could put list of options in array. and iterate thogh the array. [5, 1, 3, 7, 9, 2, 4, 6, 8]
      elsif !board.taken?("1")
        user_input = "1"
      elsif !board.taken?("3")
        user_input = "3"
      elsif !board.taken?("7")
        user_input = "7"
      elsif !board.taken?("9")
        user_input = "9"
      elsif !board.taken?("2")
        user_input = "2"
      elsif !board.taken?("4")
        user_input = "4"
      elsif !board.taken?("6")
        user_input = "6"
      elsif !board.taken?("8")
        user_input = "8"
      end
    end
  end
end
