module Players
  class Human < Player
    def move(board)
      puts 'Please enter 1-9:'
      input = gets.chomp
      index = board.input_to_index(input)
      if board.valid_move?(index)
<<<<<<< HEAD
        input
=======
        index
>>>>>>> 36609985f4c8c1872b6c52f737c6607dfd35613c
      else
        move(board)
      end
    end
  end
end
