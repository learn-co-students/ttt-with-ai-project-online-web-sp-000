module Players
  class Human < Player

    def move(board)
      puts "Please make your move:"
      puts board.display
      move = gets.strip
    end

  end
end
