module Players
  class Human < Player

    def move(board)
      puts "Player #{@token}: Please select a position between 1-9:"
      gets.strip
    end
  end
end