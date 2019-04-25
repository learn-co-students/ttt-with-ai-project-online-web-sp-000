class Players
  class Human < Player
    def move(board)
      target = 0
      until board.valid_move?(target)
        puts "#{@token}'s turn..."
        puts "Where would you like to move?"
        target = gets.strip
      end
      board.update(target, self)
      target
    end
  end
end
