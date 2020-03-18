module Players
  class Human < Player
    def move(board)
      puts "Where would you like to move (1-9): "
      board.display
      player_input = gets.strip
      player_input
    end
  end
end
