module Players
  class Human < Player
    def move(board)
      puts 'Please enter 1-9:'
      input = gets.chomp
      index = board.input_to_index(input)
      if board.valid_move?(index)
        input
      else
        move(board)
      end
    end
  end
end
